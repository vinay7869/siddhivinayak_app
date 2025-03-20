import 'package:flutter/material.dart';

import '../Pages/My Homepage/my_homepage.dart';
import '../Pages/Profile%20Page/profilepage.dart';

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
