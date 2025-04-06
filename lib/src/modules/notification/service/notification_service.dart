import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;

// This needs to be a top-level function
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  Log.dev('Handling background message: ${message.messageId}');
}

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();
  
  Future<void> initialize() async {
    tz_data.initializeTimeZones();
    
    // Request permission for notifications
    await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    
    // Set up FCM message handlers
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    
    // Initialize local notifications
    const AndroidInitializationSettings androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iosSettings = DarwinInitializationSettings();
    const InitializationSettings initSettings = InitializationSettings(android: androidSettings, iOS: iosSettings);
    
    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );
    
    await _createNotificationChannel();
  }
  
  Future<void> _onNotificationTapped(NotificationResponse response) async {
    Log.dev('Notification tapped: ${response.payload}');
    // You can implement navigation to the related event page here
  }
  
  void _handleForegroundMessage(RemoteMessage message) {
    Log.dev('Handling foreground message: ${message.messageId}');
    _showLocalNotification(message);
  }
  
  Future<void> _showLocalNotification(RemoteMessage message) async {
    final androidDetails = const AndroidNotificationDetails(
      'event_notifications',
      'Event Notifications',
      channelDescription: 'Notifications for calendar events',
      importance: Importance.high,
      priority: Priority.high,
    );
    
    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: const DarwinNotificationDetails(),
    );
    
    await _localNotifications.show(
      message.hashCode,
      message.notification?.title ?? 'Event Reminder',
      message.notification?.body ?? '',
      notificationDetails,
      payload: message.data['eventId'],
    );
  }
  
  Future<void> _createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'event_notifications',
      'Event Notifications',
      description: 'Notifications for calendar events',
      importance: Importance.high,
    );
    
    await _localNotifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }
  
  Future<void> scheduleEventNotification({
    required String eventId,
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) async {
    final androidDetails = const AndroidNotificationDetails(
      'event_notifications',
      'Event Notifications',
      channelDescription: 'Notifications for calendar events',
      importance: Importance.high,
      priority: Priority.high,
    );
    
    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: const DarwinNotificationDetails(),
    );
    
    // Convert to timezone-aware DateTime
    final scheduledDate = tz.TZDateTime.from(scheduledTime, tz.local);
    
    try {
      await _localNotifications.zonedSchedule(
        eventId.hashCode,
        title,
        body,
        scheduledDate,
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: eventId,
      );
      
      Log.dev('Scheduled notification for event $eventId at $scheduledTime');
    } catch (e) {
      Log.dev('Error scheduling notification: $e');
    }
  }
  
  Future<String?> getDeviceToken() async {
    return await _fcm.getToken();
  }
  
  Future<void> cancelEventNotification(String eventId) async {
    await _localNotifications.cancel(eventId.hashCode);
  }
}