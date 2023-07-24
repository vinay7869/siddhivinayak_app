import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siddhivinayak_app/Pages/Appointment%20Booking/booking_repository.dart';

final bookingControllerProvider = Provider((ref) {
  final bookingRepository = ref.watch(bookingRepositoryProvider);
  return BookingController(bookingRepository: bookingRepository);
});

class BookingController {
  BookingRepository bookingRepository;

  BookingController({required this.bookingRepository});

  void saveBookingHistory(
      BuildContext context, DateTime selectedDate) {
    bookingRepository.saveBookingHistory(context, selectedDate);
  }
}
