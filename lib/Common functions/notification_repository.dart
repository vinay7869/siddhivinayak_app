import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings androidInitializationSettings =
      const AndroidInitializationSettings('logo');

  void initialize() async {
    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  final AndroidNotificationDetails androidNotificationDetails =
      const AndroidNotificationDetails('channelId', 'channelName',
          importance: Importance.max,
          channelShowBadge: true,
          icon: 'logo',
          largeIcon: DrawableResourceAndroidBitmap('logo'));

  void sendNotification(String? title, String? body) async {
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
        0, title, body, notificationDetails);
  }

  void scheduleNotification(String? title, String? body) async {
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.periodicallyShow(
        0, title, body, RepeatInterval.daily, notificationDetails);
  }

  void stopNotification() async {
    flutterLocalNotificationsPlugin.cancel(0);
  }

  void bigPictureNotification(String? title, String? body) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('channelId', 'channelName',
            styleInformation: BigPictureStyleInformation(
                DrawableResourceAndroidBitmap('logo')),
            importance: Importance.max,
            channelShowBadge: true,
            icon: 'logo',
            largeIcon: DrawableResourceAndroidBitmap('logo'));
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
        1, title, body, notificationDetails);
  }
}
