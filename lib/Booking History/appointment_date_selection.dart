import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siddhivinayak_app/Booking%20History/booking_controller.dart';
import 'package:siddhivinayak_app/Pages/appointment_booking.dart';
import '../Pages/confirmationpage.dart';

class AppointmentDateSelection extends ConsumerStatefulWidget {
  const AppointmentDateSelection({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<AppointmentDateSelection> createState() =>
      _AppointmentDateSelectionState();
}

class _AppointmentDateSelectionState
    extends ConsumerState<AppointmentDateSelection> {
  DateTime? selectedDateTime;

  void pickaDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    ).then((value) {
      setState(() {
        selectedDateTime = value!;
      });
    });
  }

  void saveBookingHistory() {
    if (selectedDateTime != null) {
      ref
          .read(bookingControllerProvider)
          .saveBookingHistory(context, selectedDateTime!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Appointment Booking',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.red),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AppointmentBooking()));
            },
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30),
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Pick a date for the darshan',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: pickaDate,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                      color: Colors.red, style: BorderStyle.solid, width: 2),
                ),
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(selectedDateTime != null
                            ? '${selectedDateTime!.day}/${selectedDateTime!.month}/${selectedDateTime!.year}'
                            : 'Select a date')),
                    const Spacer(),
                    Container(
                        width: 50,
                        height: 47,
                        color: Colors.red,
                        child: const Icon(Icons.event_available,
                            color: Colors.white, size: 22))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Mention number of people',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                height: 70,
                width: 50,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.purple, width: 2),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.people,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                ),
              ),
            ),
            const SizedBox(height: 90),
            GestureDetector(
              onTap: () {
                saveBookingHistory();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfirmationPage(),
                    ));
              },
              child: Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.only(left: 80, right: 80, top: 200),
                decoration: BoxDecoration(
                  gradient:
                      const LinearGradient(colors: [Colors.red, Colors.orange]),
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Done',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }
}
