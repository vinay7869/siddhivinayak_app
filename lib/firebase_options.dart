// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC38eXfZjpcwzpLhJvc6oGSBkhKHaM6AiQ',
    appId: '1:790413288828:web:3d986de62b6f783b57b0f9',
    messagingSenderId: '790413288828',
    projectId: 'siddhivinayak-562a2',
    authDomain: 'siddhivinayak-562a2.firebaseapp.com',
    storageBucket: 'siddhivinayak-562a2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBkVGpHL3MQKShVpdTCzN4Ur04_n5EEm8Q',
    appId: '1:790413288828:android:c4ff23231509a74b57b0f9',
    messagingSenderId: '790413288828',
    projectId: 'siddhivinayak-562a2',
    storageBucket: 'siddhivinayak-562a2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfUpTdL6Oiha8gdR4Fdvvg39ZR52f8OsE',
    appId: '1:790413288828:ios:7e4962d3fb93efef57b0f9',
    messagingSenderId: '790413288828',
    projectId: 'siddhivinayak-562a2',
    storageBucket: 'siddhivinayak-562a2.appspot.com',
    iosClientId: '790413288828-gv6nkd8iekusbl2fsbg6ci1t9c6hvs37.apps.googleusercontent.com',
    iosBundleId: 'com.example.siddhivinayakApp',
  );
}