import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import * as LunarModule from "lunar-javascript";

// Initialize Firebase if not already initialized
if (!admin.apps.length) {
  admin.initializeApp();
}

const db = admin.firestore();
const messaging = admin.messaging();

// Initialize lunar library components using self-invoking functions
const { Lunar, Solar } = (() => {
  // Start with null values
  let lunarLib: typeof LunarModule.Lunar | null = null;
  let solarLib: typeof LunarModule.Solar | null = null;
  
  try {
    // Check what's available in the module
    console.log("Lunar Module Structure:", Object.keys(LunarModule));
    
    // Try different initialization approaches
    if (LunarModule.Lunar) {
      lunarLib = LunarModule.Lunar;
      solarLib = LunarModule.Solar;
      console.log("Direct assignment successful");
    } 
    else if (typeof (LunarModule as any).default === 'function') {
      try {
        const library = (LunarModule as any).default();
        if (library && typeof library === 'object') {
          lunarLib = library.Lunar;
          solarLib = library.Solar;
          console.log("Initialized via default export");
        }
      } catch (initError) {
        console.error("Error initializing via default export:", initError);
      }
    }
    else {
      console.error("Could not initialize lunar-javascript library");
    }
  } catch (error) {
    console.error("Error initializing lunar-javascript:", error);
  }
  
  return { 
    Lunar: lunarLib, 
    Solar: solarLib
  };
})();

// This function runs every 1 minute to check for pending notifications
export const sendScheduledNotifications = functions.scheduler.onSchedule(
  "every 1 minutes",
  async () => {
    const now = admin.firestore.Timestamp.now();
    const oneMinuteBeforeNow = new admin.firestore.Timestamp(
      now.seconds - 60,
      now.nanoseconds
    );

    console.log(
      `Checking for notifications between ${oneMinuteBeforeNow.toDate()} and ${now.toDate()}`
    );

    try {
      const userCollections = await db
        .collection("notifications")
        .doc("users")
        .listCollections();

      const promises: Promise<any>[] = [];

      for (const userCollection of userCollections) {
        const userId = userCollection.id;
        const snapshot = await db
          .collection("notifications")
          .doc("users")
          .collection(userId)
          .where("scheduledTime", ">=", oneMinuteBeforeNow)
          .where("scheduledTime", "<=", now)
          .get();
          
        if (snapshot.empty) continue;
        
        console.log(`Found ${snapshot.size} notifications to process for user ${userId}`);
        
        snapshot.forEach((doc) => {
          const notification = doc.data();
          
          if (!notification.deviceToken) {
            console.log(`No device token for notification ${doc.id}`);
            promises.push(doc.ref.delete());
            return;
          }
          
          const message = {
            token: notification.deviceToken,
            notification: {
              title: notification.title,
              body: notification.body,
            },
            data: {
              eventId: notification.eventId,
              click_action: "FLUTTER_NOTIFICATION_CLICK",
            },
            android: {
              priority: "high" as const,
              notification: {
                channelId: "event_notifications",
              },
            },
            apns: {
              payload: {
                aps: {
                  contentAvailable: true,
                  sound: "default",
                },
              },
            },
          };
          
          // Send notification and handle recurrence
          const promise = messaging
            .send(message)
            .then(async () => {
              console.log(`Successfully sent notification for event ${notification.eventId}`);
              
              // Handle recurrence based on repeatedFrequencyAt
              const repeatedFrequencyAt = notification.repeatedFrequencyAt || "";
              const calendarCategory = notification.calendarCategory || "SOLAR";
              const endDate = notification.endDate ? 
                (typeof notification.endDate.toDate === 'function' ? 
                  notification.endDate.toDate() : new Date(notification.endDate)) : 
                null;
              
              // Check if we should keep the notification for future recurrence
              if (repeatedFrequencyAt) {
                let nextScheduledTime: Date | null = null;
                const currentScheduledTime = notification.scheduledTime.toDate();
                
                // Handle based on calendar type
                if (calendarCategory === "LUNAR" && Lunar && Solar) {
                  console.log(`Processing lunar calendar recurrence for notification ${doc.id}`);
                  
                  try {
                    // If lunar library available, use it for conversions
                    // Convert current scheduled time to lunar date
                    const solarDate = Solar.fromDate(currentScheduledTime);
                    const lunarDate = solarDate.getLunar();
                    
                    console.log(`Current lunar date: ${lunarDate.getDay()}/${lunarDate.getMonth()}/${lunarDate.getYear()} (leap month: ${lunarDate.isLeap})`);
                    
                    // Calculate next occurrence based on recurrence rule
                    if (repeatedFrequencyAt === "RRULE:FREQ=DAILY;INTERVAL=1") {
                      // Daily recurrence - create a new solar date one day later and convert back to lunar
                      const nextSolarDate = new Date(currentScheduledTime);
                      nextSolarDate.setDate(nextSolarDate.getDate() + 1);
                      
                      nextScheduledTime = nextSolarDate;
                      console.log(`Daily recurrence: Next notification at ${nextScheduledTime}`);
                    } 
                    else if (repeatedFrequencyAt === "RRULE:FREQ=WEEKLY;INTERVAL=1") {
                      // Weekly - create a new solar date 7 days later and convert back to lunar
                      const nextSolarDate = new Date(currentScheduledTime);
                      nextSolarDate.setDate(nextSolarDate.getDate() + 7);
                      
                      nextScheduledTime = nextSolarDate;
                      console.log(`Weekly recurrence: Next notification at ${nextScheduledTime}`);
                    } 
                    else if (repeatedFrequencyAt === "RRULE:FREQ=WEEKLY;INTERVAL=2") {
                      // Bi-weekly - create a new solar date 14 days later and convert back to lunar
                      const nextSolarDate = new Date(currentScheduledTime);
                      nextSolarDate.setDate(nextSolarDate.getDate() + 14);
                      
                      nextScheduledTime = nextSolarDate;
                      console.log(`Bi-weekly recurrence: Next notification at ${nextScheduledTime}`);
                    } 
                    else if (repeatedFrequencyAt === "RRULE:FREQ=MONTHLY;INTERVAL=1") {
                      // Monthly - attempt to increment lunar month
                      try {
                        // Create new lunar date with month+1
                        let newMonth = lunarDate.getMonth() + 1;
                        let newYear = lunarDate.getYear();
                        
                        if (newMonth > 12) {
                          newMonth = 1;
                          newYear++;
                        }
                        
                        // Create new lunar date and get its solar equivalent
                        const newLunar = Lunar.fromYmd(
                          newYear,
                          newMonth,
                          lunarDate.getDay()
                        );
                        const newSolar = newLunar.getSolar();
                        
                        // Create JS Date from solar date
                        nextScheduledTime = new Date(
                          newSolar.getYear(),
                          newSolar.getMonth() - 1, // JS months are 0-based
                          newSolar.getDay()
                        );
                        
                        // Preserve time portion
                        nextScheduledTime.setHours(
                          currentScheduledTime.getHours(),
                          currentScheduledTime.getMinutes(),
                          currentScheduledTime.getSeconds()
                        );
                        
                        console.log(`Monthly lunar recurrence: Next notification at ${nextScheduledTime}`);
                      } catch (err) {
                        console.error("Error calculating lunar monthly recurrence:", err);
                        // Fallback to solar monthly recurrence
                        nextScheduledTime = new Date(currentScheduledTime);
                        nextScheduledTime.setMonth(nextScheduledTime.getMonth() + 1);
                        console.log(`Fallback to solar monthly recurrence: ${nextScheduledTime}`);
                      }
                    } 
                    else if (repeatedFrequencyAt === "RRULE:FREQ=YEARLY;INTERVAL=1") {
                      // Yearly - add 1 to lunar year
                      try {
                        // Create new lunar date with year+1
                        const newLunar = Lunar.fromYmd(
                          lunarDate.getYear() + 1,
                          lunarDate.getMonth(),
                          lunarDate.getDay()
                        );
                        const newSolar = newLunar.getSolar();
                        
                        // Create JS Date from solar date
                        nextScheduledTime = new Date(
                          newSolar.getYear(),
                          newSolar.getMonth() - 1, // JS months are 0-based
                          newSolar.getDay()
                        );
                        
                        // Preserve time portion
                        nextScheduledTime.setHours(
                          currentScheduledTime.getHours(),
                          currentScheduledTime.getMinutes(),
                          currentScheduledTime.getSeconds()
                        );
                        
                        console.log(`Yearly lunar recurrence: Next notification at ${nextScheduledTime}`);
                      } catch (err) {
                        console.error("Error calculating lunar yearly recurrence:", err);
                        // Fallback to solar yearly recurrence
                        nextScheduledTime = new Date(currentScheduledTime);
                        nextScheduledTime.setFullYear(nextScheduledTime.getFullYear() + 1);
                        console.log(`Fallback to solar yearly recurrence: ${nextScheduledTime}`);
                      }
                    } else {
                      // Unrecognized recurrence pattern
                      console.log(`Unrecognized recurrence pattern: ${repeatedFrequencyAt}, deleting notification`);
                      return doc.ref.delete();
                    }
                  } catch (error) {
                    console.error("Error in lunar calendar handling:", error);
                    // Fallback to solar calendar handling
                    console.log("Falling back to solar calendar handling");
                    nextScheduledTime = getSolarNextOccurrence(currentScheduledTime, repeatedFrequencyAt);
                  }
                } else {
                  // SOLAR calendar recurrence (or lunar library not available)
                  nextScheduledTime = getSolarNextOccurrence(currentScheduledTime, repeatedFrequencyAt);
                }
                
                // If we couldn't calculate the next time using any method
                if (!nextScheduledTime) {
                  console.log(`Could not calculate next occurrence for ${repeatedFrequencyAt}, deleting notification`);
                  return doc.ref.delete();
                }
                
                // Check if next occurrence is past the event end date
                if (endDate && nextScheduledTime > endDate) {
                  console.log(`Next recurrence (${nextScheduledTime}) is after end date (${endDate}), deleting notification`);
                  return doc.ref.delete();
                }
                
                // Update the notification with the new scheduled time
                return doc.ref.update({
                  scheduledTime: admin.firestore.Timestamp.fromDate(nextScheduledTime),
                  lastSentAt: admin.firestore.FieldValue.serverTimestamp(),
                });
              } else {
                // Not a recurring notification, delete it
                console.log(`One-time notification completed, deleting`);
                return doc.ref.delete();
              }
            })
            .catch((error) => {
              console.error(`Error sending notification ${doc.id}:`, error);
              
              // Update with error information
              return doc.ref.update({
                error: error.message,
                errorAt: admin.firestore.FieldValue.serverTimestamp(),
              });
            });
          
          promises.push(promise);
        });
      }

      if (promises.length === 0) {
        console.log("No notifications to send");
        return;
      }

      await Promise.all(promises);
      console.log("Notification processing complete");
    } catch (error) {
      console.error("Error in sendScheduledNotifications:", error);
    }
  }
);

// This function triggers when a new event is created or updated
export const createNotificationSchedule = functions.firestore.onDocumentWritten(
  "users/{userId}/events/{eventId}",
  async (event) => {
    const userId = event.params.userId;
    const eventId = event.params.eventId;

    // Get the before and after snapshots
    const afterSnapshot = event.data?.after;

    // If document was deleted, remove any pending notifications
    if (!afterSnapshot?.exists) {
      console.log(`Event ${eventId} was deleted, removing notifications`);
      const notificationsSnapshot = await db
        .collection("notifications")
        .doc("users")
        .collection(userId)
        .where("eventId", "==", eventId)
        .get();

      const deletePromises: Promise<FirebaseFirestore.WriteResult>[] = [];
      notificationsSnapshot.forEach((doc) => {
        deletePromises.push(doc.ref.delete());
      });

      await Promise.all(deletePromises);
      return;
    }

    // Get the event data
    const eventData = afterSnapshot.data();
    if (!eventData) return;

    // Get user's device tokens
    const userSnapshot = await db.collection("users").doc(userId).get();

    const userData = userSnapshot.data();
    if (!userData || !userData.deviceTokens || !userData.deviceTokens.length) {
      console.log(`No device tokens found for user ${userId}`);
      return;
    }

    // Calculate notification time based on remindMeBefore
    let startDate;
    if (
      eventData.startDate &&
      typeof eventData.startDate.toDate === "function"
    ) {
      // If it's a Firestore Timestamp object
      startDate = eventData.startDate.toDate();
      console.log(
        `Event start time (from Timestamp): ${startDate} (raw value: ${eventData.startDate})`
      );
    } else if (eventData.startDate && eventData.startDate._seconds) {
      // If it's a serialized Firestore Timestamp
      startDate = new Date(eventData.startDate._seconds * 1000);
      console.log(`Event start time (from _seconds): ${startDate}`);
    } else if (eventData.startDate) {
      // If it's a string or something else
      startDate = new Date(eventData.startDate);
      console.log(`Event start time (from string): ${startDate}`);
    } else {
      console.log(`No valid startDate found for event ${eventId}`);
      return;
    }

    // Get remindMeBefore value in minutes
    const remindMeBefore = eventData.remindMeBefore || 0; // Default to 0 if not set
    console.log(
      `remindMeBefore: ${remindMeBefore} hours (${remindMeBefore * 60} minutes)`
    );
    const reminderMinutes = remindMeBefore * 60; // Convert hours to minutes

    const notificationTime = new Date(
      startDate.getTime() - reminderMinutes * 60 * 1000
    );

    console.log(`Original start time: ${startDate}`);
    console.log(`Calculated notification time: ${notificationTime}`);

    // Adjust for Vietnam timezone (UTC+7)
    const vietnamOffsetMillis = 7 * 60 * 60 * 1000; // 7 hours in milliseconds

    // Create a timestamp that will display as the correct local time in Vietnam
    const adjustedNotificationTime = new Date(
      notificationTime.getTime() - vietnamOffsetMillis
    );

    console.log(
      `Adjusted notification time for storage: ${adjustedNotificationTime}`
    );
    console.log(
      `Firebase Timestamp for notification: ${admin.firestore.Timestamp.fromDate(
        adjustedNotificationTime
      )}`
    );

    // Skip if notification time is in the past
    if (notificationTime < new Date()) {
      console.log(`Notification time already passed for event ${eventId}`);
      return;
    }

    // Format event time for notification body
    const timeFormatter = new Intl.DateTimeFormat("en-US", {
      hour: "numeric",
      minute: "2-digit",
      hour12: true,
    });
    const formattedTime = timeFormatter.format(startDate);

    // First, check if there are existing notifications for this event that need to be updated
    const existingNotificationsSnapshot = await db
      .collection("notifications")
      .doc("users")
      .collection(userId)
      .where("eventId", "==", eventId)
      .get();

    if (!existingNotificationsSnapshot.empty) {
      console.log(
        `Found ${existingNotificationsSnapshot.size} existing notifications to update for event ${eventId}`
      );

      // Create a map of existing device tokens to notification docs
      const existingNotifications = new Map();
      existingNotificationsSnapshot.forEach((doc) => {
        const data = doc.data();
        if (data.deviceToken) {
          existingNotifications.set(data.deviceToken, doc.ref);
        } else {
          // Delete notifications without device tokens
          doc.ref.delete();
        }
      });

      // Update existing notifications and create new ones as needed
      const promises = [];

      // Process each device token
      for (const deviceToken of userData.deviceTokens) {
        const notificationBody = eventData.location
          ? `At ${eventData.location} at ${formattedTime}`
          : `At ${formattedTime}`;

        if (existingNotifications.has(deviceToken)) {
          // Update existing notification for this device token
          const updateData = {
            userId,
            eventId,
            deviceToken,
            title: eventData.title,
            calendarCategory: eventData.calendarCategory,
            body: notificationBody,
            startDate: eventData.startDate,
            endDate: eventData.endDate,
            remindMeBefore,
            repeatedFrequencyAt: eventData.repeatedFrequencyAt,
            scheduledTime: admin.firestore.Timestamp.fromDate(
              adjustedNotificationTime
            ),
            updatedAt: admin.firestore.FieldValue.serverTimestamp(),
          };

          const notificationRef = existingNotifications.get(deviceToken);
          promises.push(notificationRef.update(updateData));
          existingNotifications.delete(deviceToken); // Mark as processed
        } else {
          // Create new notification for this device token
          const createData = {
            userId,
            eventId,
            deviceToken,
            title: eventData.title,
            calendarCategory: eventData.calendarCategory,
            body: notificationBody,
            startDate: eventData.startDate,
            endDate: eventData.endDate,
            remindMeBefore,
            repeatedFrequencyAt: eventData.repeatedFrequencyAt,
            scheduledTime: admin.firestore.Timestamp.fromDate(
              adjustedNotificationTime
            ),
            createdAt: admin.firestore.FieldValue.serverTimestamp(),
          };

          promises.push(
            db
              .collection("notifications")
              .doc("users")
              .collection(userId)
              .add(createData)
          );
        }
      }

      // Delete any notifications for device tokens that no longer exist
      for (const notificationRef of existingNotifications.values()) {
        promises.push(notificationRef.delete());
      }

      await Promise.all(promises);
      console.log(`Updated notifications for event ${eventId}`);
    } else {
      // No existing notifications, create new ones for each device token

      const notificationPromises: Promise<FirebaseFirestore.DocumentReference>[] =
        [];
      for (const deviceToken of userData.deviceTokens) {
        const notificationData = {
          userId,
          eventId,
          deviceToken,
          title: eventData.title,
          calendarCategory: eventData.calendarCategory,
          body: `${
            eventData.location
              ? `At ${eventData.location} at ${formattedTime}`
              : `At ${formattedTime}`
          }`,
          startDate: eventData.startDate,
          endDate: eventData.endDate,
          remindMeBefore,
          repeatedFrequencyAt: eventData.repeatedFrequencyAt,
          scheduledTime: admin.firestore.Timestamp.fromDate(
            adjustedNotificationTime
          ),
          createdAt: admin.firestore.FieldValue.serverTimestamp(),
        };

        notificationPromises.push(
          db
            .collection("notifications")
            .doc("users")
            .collection(userId)
            .add(notificationData)
        );
      }

      await Promise.all(notificationPromises);
      console.log(
        `Created ${notificationPromises.length} notification schedules for event ${eventId}`
      );
    }
  }
);

// Helper function for solar calendar recurrence calculation
function getSolarNextOccurrence(currentScheduledTime: Date, repeatedFrequencyAt: string): Date | null {
  let nextScheduledTime: Date | null = null;
  
  if (repeatedFrequencyAt === "RRULE:FREQ=DAILY;INTERVAL=1") {
    // Daily recurrence
    nextScheduledTime = new Date(currentScheduledTime);
    nextScheduledTime.setDate(nextScheduledTime.getDate() + 1);
    console.log(`Daily recurrence: Next notification at ${nextScheduledTime}`);
    
  } else if (repeatedFrequencyAt === "RRULE:FREQ=WEEKLY;INTERVAL=1") {
    // Weekly recurrence
    nextScheduledTime = new Date(currentScheduledTime);
    nextScheduledTime.setDate(nextScheduledTime.getDate() + 7);
    console.log(`Weekly recurrence: Next notification at ${nextScheduledTime}`);
    
  } else if (repeatedFrequencyAt === "RRULE:FREQ=WEEKLY;INTERVAL=2") {
    // Bi-weekly recurrence
    nextScheduledTime = new Date(currentScheduledTime);
    nextScheduledTime.setDate(nextScheduledTime.getDate() + 14);
    console.log(`Bi-weekly recurrence: Next notification at ${nextScheduledTime}`);
    
  } else if (repeatedFrequencyAt === "RRULE:FREQ=MONTHLY;INTERVAL=1") {
    // Monthly recurrence
    nextScheduledTime = new Date(currentScheduledTime);
    nextScheduledTime.setMonth(nextScheduledTime.getMonth() + 1);
    console.log(`Monthly recurrence: Next notification at ${nextScheduledTime}`);
    
  } else if (repeatedFrequencyAt === "RRULE:FREQ=YEARLY;INTERVAL=1") {
    // Yearly recurrence
    nextScheduledTime = new Date(currentScheduledTime);
    nextScheduledTime.setFullYear(nextScheduledTime.getFullYear() + 1);
    console.log(`Yearly recurrence: Next notification at ${nextScheduledTime}`);
    
  } else {
    // Unrecognized recurrence pattern
    console.log(`Unrecognized recurrence pattern: ${repeatedFrequencyAt}`);
    return null;
  }
  
  return nextScheduledTime;
}