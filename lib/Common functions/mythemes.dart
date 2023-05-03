import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode changeMode = ThemeMode.dark;
  bool get isDarkMode => changeMode == ThemeMode.dark;

  void changeTheme(bool isOn) {
    changeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static var darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    primaryColor: Colors.white10,
    iconTheme: const IconThemeData(color: Colors.green),
  );

  static var lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(color: Colors.white),
    iconTheme: const IconThemeData(color: Colors.green),
    primaryColor: Colors.black26,
  );
}
