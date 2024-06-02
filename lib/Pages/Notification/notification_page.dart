import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NotificationPage extends StatefulWidget {
  static const routeName = '/notificationPage';
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final message =
        ModalRoute.of(context)?.settings.arguments as RemoteMessage?;
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
        body: ListView(
          children: [
            message != null
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: Theme.of(context).primaryColor,
                      title: Text('${message.notification!.title}'),
                      titleTextStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.red),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${message.notification!.body}'),
                      ),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 100),
                      SizedBox(
                          height: 150,
                          width: 150,
                          child: CachedNetworkImage(
                              placeholder: (context, url) => const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator()),
                              imageUrl:
                                  'https://pngimg.com/uploads/exclamation_mark/exclamation_mark_PNG48.png')),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'No new notification',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      )
                    ],
                  )
          ],
        ));
  }
}
