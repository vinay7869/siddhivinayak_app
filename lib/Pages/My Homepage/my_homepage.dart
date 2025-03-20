import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Appointment%20Booking/appointment_booking.dart';
import '../Appointment%20Booking/my_bookings.dart';
import '../My%20Homepage/carousel_slider.dart';
import '../My%20Homepage/drawer_items.dart';
import '../Notification/notification_page.dart';
import '../settings_page.dart';
import '../live_darshan.dart';
import '../Profile Page/profilepage.dart';

class MyHomePage extends StatefulWidget {
  static const routename = '/myHomepage';
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home", style: TextStyle(color: Colors.redAccent)),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (_) => const NotificationPage()));
            },
            icon: const Icon(
              Icons.notifications,
            ),
          ),
          IconButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            icon: const Icon(Icons.power_settings_new),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.red),
      ),
      drawer: const DrawerItems(),
      body: ListView(
        children: <Widget>[
          const CarouselSliderItems(),
          const SizedBox(height: 7),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyProfile(),
                    ));
                // Navigator.pushNamed(context, MyProfile.routename);
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
                      MaterialPageRoute(builder: (_) => const MySettings()));
                }),
          ),
        ],
      ),
    );
  }
}
