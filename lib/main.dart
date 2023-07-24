import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as prefix;
import 'package:provider/provider.dart';
import 'package:siddhivinayak_app/Common%20functions/mythemes.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:siddhivinayak_app/Pages/Notification/notification_page.dart';
import 'package:siddhivinayak_app/Pages/Notification/notification_repository.dart';
import 'package:siddhivinayak_app/Common%20functions/router.dart';
import 'Pages/My Homepage/my_homepage.dart';
import 'firebase_options.dart';

final globalNavKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationRepository().initNotification();
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
      builder: (context, index) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: "SiddhiVinayak",
          debugShowCheckedModeBanner: false,
          home: MyHomePage(),
          // AnimatedSplashScreen(
          //     splash: const Image(image: AssetImage('assets/AK.jpeg')),
          //     backgroundColor: Colors.white,
          //     splashIconSize: 200,
          //     duration: 3000,
          //     splashTransition: SplashTransition.fadeTransition,
          //     nextScreen: const MyHomePage()),
          themeMode: themeProvider.changeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          navigatorKey: globalNavKey,
          routes: {
            NotificationPage.routeName: (context) => const NotificationPage()
          },
          onGenerateRoute: (settings) => routers(settings),
        );
      },
    );
  }
}
