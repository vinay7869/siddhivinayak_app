import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Appointment%20Booking/date_model.dart';
import '../Profile Page/image_picker.dart';

final bookingRepositoryProvider = Provider(
    (ref) => BookingRepository(firebaseFirestore: FirebaseFirestore.instance));

class BookingRepository {
  FirebaseFirestore firebaseFirestore;

  BookingRepository({required this.firebaseFirestore});

  void saveBookingHistory(BuildContext context, DateTime selectedDate) async {
    try {
      var uid = 'user1';
      var user = DateModel(dateTime: selectedDate);

      await firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('datetime')
          .doc()
          .set(user.toMap());
    } catch (e) {
      showSnackbar(context: context, content: e.toString());
    }
  }
}
