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
        return macos;
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
    apiKey: 'AIzaSyCI5kJrKy54RoN1lToB1m90F4HQGXpcO0s',
    appId: '1:1074442014071:web:60bab165c14197ff856572',
    messagingSenderId: '1074442014071',
    projectId: 'fire-chat-c582f',
    authDomain: 'fire-chat-c582f.firebaseapp.com',
    storageBucket: 'fire-chat-c582f.appspot.com',
    measurementId: 'G-EZ1SE4NT81',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASQD6nq-q0hmRd2z4TH-YifNFxxjFeJSw',
    appId: '1:1074442014071:android:48944ed751599de0856572',
    messagingSenderId: '1074442014071',
    projectId: 'fire-chat-c582f',
    storageBucket: 'fire-chat-c582f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIJIQbjJEnw7BOkSIr97Vll4gAoBTrH_Y',
    appId: '1:1074442014071:ios:6a33e17a4db23197856572',
    messagingSenderId: '1074442014071',
    projectId: 'fire-chat-c582f',
    storageBucket: 'fire-chat-c582f.appspot.com',
    iosBundleId: 'com.example.chatFire',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCIJIQbjJEnw7BOkSIr97Vll4gAoBTrH_Y',
    appId: '1:1074442014071:ios:9675b2d1c4bc9eb3856572',
    messagingSenderId: '1074442014071',
    projectId: 'fire-chat-c582f',
    storageBucket: 'fire-chat-c582f.appspot.com',
    iosBundleId: 'com.example.chatFire.RunnerTests',
  );
}
