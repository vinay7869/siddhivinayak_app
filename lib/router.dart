import 'package:flutter/material.dart';
import 'package:siddhivinayak_app/Profile_storage/profilepage.dart';
import 'Pages/my_homepage.dart';

Route<dynamic> routers(RouteSettings settings) {
  switch (settings.name) {
    case MyHomePage.routename:
      return MaterialPageRoute(
        builder: (context) => const MyHomePage(),
      );
    case MyProfile.routename:
      return MaterialPageRoute(
        builder: (context) => const MyProfile(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Error'),
          ),
        ),
      );
  }
}
