import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:siddhivinayak_app/Booking%20History/date_model.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({super.key});

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  final uid = 'user1';
  bool showOnline = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Bookings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.red),
            onPressed: () => Navigator.pop(context)),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .collection('datetime')
              .orderBy('dateTime', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var currentDate = DateTime.now();
                  var history = snapshot.data!.docs[index].data();
                  var myHistory = DateModel.fromMap(history);
                  if (myHistory.dateTime.isAfter(currentDate)) {
                    showOnline = true;
                  } else {
                    showOnline = false;
                  }
                  return Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Container(
                              height: 80,
                              width: double.infinity,
                              color: Theme.of(context).primaryColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(DateFormat.yMMMMEEEEd()
                                      .format(myHistory.dateTime)),
                                  Text(DateFormat.jm()
                                      .format(myHistory.dateTime)),
                                  showOnline
                                      ? Icon(Icons.double_arrow_outlined,
                                          color:
                                              Theme.of(context).iconTheme.color)
                                      : const Icon(Icons.double_arrow_outlined,
                                          color: Colors.red)
                                ],
                              ))),
                    ],
                  );
                });
          }),
    );
  }
}
