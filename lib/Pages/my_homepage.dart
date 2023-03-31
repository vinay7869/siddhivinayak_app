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
  // late String userName;
  // late String email;
  // late String profilePic;
  late FirebaseFirestore firebaseFirestore;

  @override
  void initState() {
    super.initState();
    firebaseFirestore = FirebaseFirestore.instance;
  }

  // Future<UserModel?> getImages() async {
  //   var uid = 'user1';
  //   var userData =
  //       await FirebaseFirestore.instance.collection('users').doc(uid).get();
  //   UserModel? user;

  //   if (userData.data() != null) {
  //     user = UserModel.fromMap(userData.data()!);
  //   }

  //   userName = user!.name;
  //   email = user.emailAddress;
  //   profilePic = user.profilepic;

  //   return user;
  // }

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
                        )
                      ),
                      ListTile(
                        title: Text('Hello  ${user.name}'),
                      )
                    ]);
                  },
                );
              })),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 370,
            width: 100,
            child: Image(
              image: AssetImage(
                'assets/DSLR.jpg',
              ),
              fit: BoxFit.cover,
            ),
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
                      MaterialPageRoute(builder: (_) => const MySettings()));
                }),
          ),
        ],
      ),
    );
  }
}
