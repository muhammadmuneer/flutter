import 'package:dio/dio.dart';
import 'package:fha/utils/globals.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../models/push_notification.dart';
import 'dart:io';

class NotificationInterface {
  final FirebaseMessaging _fcm;
  late FlutterLocalNotificationsPlugin fltNotification;
  late Dio dio;

  NotificationInterface(this._fcm);

  Future initialize() async {
    if (Platform.isIOS) {
      _fcm.requestPermission(
          alert: true, badge: true, provisional: false, sound: true);
    }

    //FCM Token
    firebaseToken = await _fcm.getToken();
    if (kDebugMode) {
      print("FirebaseMessaging token: $firebaseToken");
    }

    // Android Initialization Settings.
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const androidDetails = AndroidNotificationDetails('1', 'channelName');
    //  IOS Initialization Settings.
    const iosInit = IOSInitializationSettings();
    const iosDetails = IOSNotificationDetails();

    // Init Setting.
    const initSetting =
        InitializationSettings(android: androidInit, iOS: iosInit);

    // Setting-up Local Notifications.
    fltNotification = FlutterLocalNotificationsPlugin();
    fltNotification.initialize(initSetting);

    const generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    // Notification Listener.
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        // Push Notification
        PushNotification pushNotification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
        );
        // Printing the Message details.
        if (kDebugMode) {
          print("Notification: ${pushNotification.toString()}");
        }

        fltNotification.show(pushNotification.hashCode, pushNotification.title,
            pushNotification.body, generalNotificationDetails);
      },
    );
  }
}
