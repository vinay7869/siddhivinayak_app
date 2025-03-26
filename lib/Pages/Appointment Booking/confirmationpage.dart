import 'package:flutter/material.dart';
import '../My Homepage/my_homepage.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
              textAlign: TextAlign.center,
              'Your Appointment is\nConfirmed',
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.red)),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, MyHomePage.routename, (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              child: const Text(
                'Back to Home',
                style: TextStyle(color: Colors.white, fontSize: 17),
              )),
          const SizedBox(height: 30),
        ],
      )),
    );
  }
}
