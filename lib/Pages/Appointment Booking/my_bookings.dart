import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../Appointment%20Booking/date_model.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({super.key});

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  final uid = 'user1';
  bool isPending = false;

  void openDialougeBox() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
          backgroundColor: Colors.indigo,
          title: Text(
            'Appointment already completed',
            textAlign: TextAlign.center,
          )),
    );
  }

  void _showQrCodeDialog(BuildContext context, String dateTime) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(maxHeight: 350),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'QR Code',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 16),
                QrImageView(
                  data: dateTime,
                  size: 180,
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Close',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var currentDate = DateTime.now();
                  var history = snapshot.data!.docs[index].data();
                  var myHistory = DateModel.fromMap(history);
                  if (myHistory.dateTime.isAfter(currentDate)) {
                    isPending = true;
                  } else {
                    isPending = false;
                  }

                  return Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: Theme.of(context).primaryColor),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(DateFormat.yMMMMEEEEd()
                                      .format(myHistory.dateTime)),
                                  isPending
                                      ? ElevatedButton(
                                          onPressed: () {
                                            _showQrCodeDialog(
                                              context,
                                              myHistory.dateTime
                                                  .toIso8601String(),
                                            );
                                          },
                                          style: ButtonStyle(
                                              shape: WidgetStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                              backgroundColor:
                                                  const WidgetStatePropertyAll(
                                                      Colors.orange)),
                                          child: const Text(
                                            'Tap to Scan',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))
                                      : ElevatedButton(
                                          onPressed: openDialougeBox,
                                          style: ButtonStyle(
                                              shape: WidgetStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                              backgroundColor:
                                                  const WidgetStatePropertyAll(
                                                      Colors.green)),
                                          child: const Text(
                                            'Completed',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))
                                ],
                              ))),
                    ],
                  );
                });
          }),
    );
  }
}
