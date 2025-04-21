import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_token_repo.g.dart';

@riverpod
DeviceTokenRepository deviceTokenRepository(DeviceTokenRepositoryRef ref) {
  return DeviceTokenRepository();
}

class DeviceTokenRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> saveDeviceToken(String userId) async {
    try {
      final token = await _messaging.getToken();
      if (token == null) return;

      final userRef = _firestore.collection(FirebaseCollectionName.users).doc(userId);
      
      final userDoc = await userRef.get();
      List<String> deviceTokens = [];
      
      if (userDoc.exists) {
        final userData = userDoc.data();
        if (userData != null && userData['deviceTokens'] != null) {
          deviceTokens = List<String>.from(userData['deviceTokens']);
        }
      }
      
      if (!deviceTokens.contains(token)) {
        deviceTokens.add(token);
        await userRef.set({
          'deviceTokens': deviceTokens
        }, SetOptions(merge: true));
        
      }
    } catch (e) {
      throw Exception("Error saving device token: $e");
    }
  }
  
  Future<void> removeDeviceToken(String userId) async {
    try {
      final token = await _messaging.getToken();
      if (token == null) return;
      
      final userRef = _firestore.collection(FirebaseCollectionName.users).doc(userId);
      final userDoc = await userRef.get();
      
      if (userDoc.exists) {
        final userData = userDoc.data();
        if (userData != null && userData['deviceTokens'] != null) {
          List<String> deviceTokens = List<String>.from(userData['deviceTokens']);
          
          deviceTokens.remove(token);
          
          await userRef.update({
            'deviceTokens': deviceTokens
          });
        }
      }
    } catch (e) {
      throw Exception("Error removing device token: $e");
    }
  }
}