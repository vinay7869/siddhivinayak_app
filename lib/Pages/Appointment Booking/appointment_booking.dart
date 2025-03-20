import 'package:flutter/material.dart';
import 'package:siddhivinayak_app/Pages/Profile%20Page/image_picker.dart';
import '../Appointment%20Booking/appointment_date_selection.dart';
import '../My Homepage/my_homepage.dart';

class AppointmentBooking extends StatefulWidget {
  const AppointmentBooking({Key? key}) : super(key: key);

  @override
  State<AppointmentBooking> createState() => _AppointmentBookingState();
}

class _AppointmentBookingState extends State<AppointmentBooking> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.red),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const MyHomePage()));
            },
          ),
          title: const Text("Appointment Booking",
              style: TextStyle(color: Colors.red)),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Text(
              "Gidelines for Temple visit:",
              style: TextStyle(fontSize: 15, color: Colors.red),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            const Text(
              "1. Use of Screenshots/Photos of the QR code for entry into the Temple premises will not be permitted.",
              style: TextStyle(fontSize: 12, color: Colors.red),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            const Text(
              '2. Misuse of QR code may be subject to legal actions.',
              style: TextStyle(fontSize: 12, color: Colors.red),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            const Text(
              '3.Laptops,Cameras and other electronic items are not allowed',
              style: TextStyle(fontSize: 12, color: Colors.red),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            const SizedBox(height: 10),
            ListTile(
              leading: Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.red,
                  value: _value,
                  onChanged: (newValue) {
                    setState(() {
                      _value = newValue!;
                    });
                  }),
              title: const Text(
                'I understand and agree with the guidelines above.',
                style: TextStyle(fontWeight: FontWeight.w100),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                if (_value == false) {
                  showSnackbar(
                      context: context,
                      content: 'Please acknowledge the checkbox');
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AppointmentDateSelection()));
                }
              },
              child: Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.only(left: 80, right: 80),
                decoration: BoxDecoration(
                  gradient:
                      const LinearGradient(colors: [Colors.red, Colors.orange]),
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Next',
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
