import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'notification_page.dart';
import '../../main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {}

class NotificationRepository {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  AndroidNotificationChannel androidNotificationChannel =
      const AndroidNotificationChannel('ChannelId', 'Channel Name',
          importance: Importance.defaultImportance, playSound: true);

  Future<void> initializeLocalNotification() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('@drawable/logo');
    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onDidReceiveNotificationResponse: (details) {
      //   RemoteMessage? message =
      //       RemoteMessage.fromMap(jsonEncode(details) as Map<String, dynamic>);
      //   globalNavKey.currentState
      //       ?.pushNamed(NotificationPage.routeName, arguments: details.payload);
      // },
    );
  }

  Future<void> handleMessage(RemoteMessage? message) async {
    if (message == null) return;

    globalNavKey.currentState
        ?.pushNamed(NotificationPage.routeName, arguments: message);
  }

  Future<void> pushNotification() async {
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
    await FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen(
      (event) {
        final message = event.notification;
        if (message == null) return;

        flutterLocalNotificationsPlugin
            .show(
                message.hashCode,
                message.title,
                message.body,
                NotificationDetails(
                    android: AndroidNotificationDetails(
                  androidNotificationChannel.id,
                  androidNotificationChannel.name,
                  icon: '@drawable/logo',
                  importance: Importance.defaultImportance,
                  largeIcon:
                      const DrawableResourceAndroidBitmap('@drawable/logo'),
                )),
                payload: jsonEncode(message.toMap()))
            .then(
          (value) {
            handleMessage(event);
          },
        );
      },
    );
  }

  Future<void> initNotification() async {
    await firebaseMessaging.requestPermission();
    final fcmToken = await firebaseMessaging.getToken();
    print('Token: $fcmToken');
    initializeLocalNotification();
    pushNotification();
  }
}
