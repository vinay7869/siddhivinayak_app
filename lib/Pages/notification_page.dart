import 'package:flutter/material.dart';
import 'package:siddhivinayak_app/Common%20functions/notification_repository.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    notificationServices.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Notification",
            style: TextStyle(color: Colors.red),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Trigger notification'),
              onPressed: () => notificationServices.sendNotification(
                  'New notification', 'New message'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Schedule notification'),
              onPressed: () => notificationServices.scheduleNotification(
                  'New notification', 'New message'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                child: const Text('Stop notification'),
                onPressed: () => notificationServices.stopNotification),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Big picture notification'),
              onPressed: () => notificationServices.bigPictureNotification(
                  'New notification', 'New message'),
            ),
          ],
        )));
  }
}
