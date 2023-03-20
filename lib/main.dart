import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as prefix;
import 'package:provider/provider.dart';
import 'package:siddhivinayak_app/mythemes.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:siddhivinayak_app/router.dart';
import 'Pages/my_homepage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const prefix.ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: "SiddhiVinayak",
          debugShowCheckedModeBanner: false,
          home: AnimatedSplashScreen(
              splash: const Image(image: AssetImage('assets/AK.jpeg')),
              backgroundColor: Colors.white,
              splashIconSize: 200,
              duration: 3000,
              splashTransition: SplashTransition.fadeTransition,
              nextScreen: const MyHomePage()),
          themeMode: themeProvider.changeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          onGenerateRoute: (settings) => routers(settings),
        );
      },
    );
  }
}
