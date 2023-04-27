import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siddhivinayak_app/Pages/settings.dart';
import 'package:siddhivinayak_app/Pages/youtube.dart';
import 'package:siddhivinayak_app/Profile_storage/user_model.dart';
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
  late FirebaseFirestore firebaseFirestore;
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  List images = [
    {"id": 0, "imagePath": 'assets/DSLR.jpg'},
    {"id": 1, "imagePath": 'assets/SiddhiVinayak.jpeg'},
    {"id": 2, "imagePath": 'assets/Sdv.jpg'},
  ];

  @override
  void initState() {
    super.initState();
    firebaseFirestore = FirebaseFirestore.instance;
  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        height: isSelected ? 12 : 8,
        width: isSelected ? 12 : 8,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Colors.red : Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home", style: TextStyle(color: Colors.redAccent)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const NotificationPage()));
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
      drawer: Drawer(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: firebaseFirestore.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var userData = snapshot.data!.docs[index].data();
                    var user = UserModel.fromMap(userData);
                    return Column(children: [
                      UserAccountsDrawerHeader(
                          accountName: Text(user.name),
                          accountEmail: Text(user.emailAddress),
                          currentAccountPicture: CircleAvatar(
                            backgroundImage: NetworkImage(user.profilepic),
                          )),
                      ListTile(
                        title: Text('Hello  ${user.name}'),
                      )
                    ]);
                  },
                );
              })),
      body: ListView(
        children: <Widget>[
          SizedBox(
              height: 370,
              width: 100,
              child: Stack(
                children: [
                  CarouselSlider(
                      items: images
                          .map((item) => Image.asset(
                                item['imagePath'],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ))
                          .toList(),
                      options: CarouselOptions(
                        aspectRatio: 1,
                        autoPlay: true,
                        scrollPhysics: const BouncingScrollPhysics(),
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      )),
                  Positioned(
                      bottom: 27,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var i = 0; i < images.length; i++)
                            buildIndicator(currentIndex == i)
                        ],
                      ))
                ],
              )),
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
                      MaterialPageRoute(builder: (_) => const MySettings()));
                }),
          ),
        ],
      ),
    );
  }
}
