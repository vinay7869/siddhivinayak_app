import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siddhivinayak_app/Pages/settings.dart';
import 'package:siddhivinayak_app/Pages/youtube.dart';
import '../Booking History/my_bookings.dart';
import '../Profile_storage/profilepage.dart';
import 'appointment_booking.dart';
import 'notification_page.dart';

class MyHomePage extends StatefulWidget {
  static const routename = '/myHomepage';
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home", style: TextStyle(color: Colors.redAccent)),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
          color: Colors.red,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const NotificationPage()));
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            icon: const Icon(Icons.power_settings_new),
            color: Colors.redAccent,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          const Image(
            image: AssetImage(
              'assets/DSLR.jpg',
            ),
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Container(
            height: 60,
            width: 70,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListTile(
              title: const Text("Live Darshan",
                  style: TextStyle(color: Colors.red)),
              leading: const Icon(Icons.handshake_outlined),
              trailing: const Icon(Icons.arrow_forward_rounded),
              iconColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(17)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Youtube()));
              },
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListTile(
                title: const Text("Appointment Booking",
                    style: TextStyle(color: Colors.red)),
                leading: const Icon(Icons.book_online),
                trailing: const Icon(Icons.arrow_forward_rounded),
                iconColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(17)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const AppointmentBooking()));
                }),
          ),
          const SizedBox(height: 20),
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListTile(
                title: const Text("My Bookings",
                    style: TextStyle(color: Colors.red)),
                leading: const Icon(Icons.history),
                trailing: const Icon(Icons.arrow_forward_rounded),
                iconColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(17)),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyBookings(),
                    ))),
          ),
          const SizedBox(height: 20),
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, MyProfile.routename);
              },
              title: const Text("Profile", style: TextStyle(color: Colors.red)),
              leading: const Icon(Icons.person),
              trailing: const Icon(Icons.arrow_forward_rounded),
              iconColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(17)),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListTile(
                title:
                    const Text("Settings", style: TextStyle(color: Colors.red)),
                leading: const Icon(Icons.settings),
                trailing: const Icon(Icons.arrow_forward_rounded),
                iconColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(17)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Settings()));
                }),
          ),
        ],
      ),
    );
  }
}
