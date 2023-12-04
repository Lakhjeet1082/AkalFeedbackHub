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
    apiKey: 'AIzaSyAxzgxVMAR2B_OIlGYscT7ADu6XM5uXHR4',
    appId: '1:895079374528:web:686a4f065e44b945ed9725',
    messagingSenderId: '895079374528',
    projectId: 'akal-hub-10318',
    authDomain: 'akal-hub-10318.firebaseapp.com',
    databaseURL: 'https://akal-hub-10318-default-rtdb.firebaseio.com',
    storageBucket: 'akal-hub-10318.appspot.com',
    measurementId: 'G-T4SVDWY8TB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3pdD7quESitDrttadDAnITseIIkDeFhU',
    appId: '1:895079374528:android:8b79f4ee02bcfb16ed9725',
    messagingSenderId: '895079374528',
    projectId: 'akal-hub-10318',
    databaseURL: 'https://akal-hub-10318-default-rtdb.firebaseio.com',
    storageBucket: 'akal-hub-10318.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAndUdGj4t8Tldt2et2edu3mG9gkoAhZ_A',
    appId: '1:895079374528:ios:b0cc8cc3dd24a3a8ed9725',
    messagingSenderId: '895079374528',
    projectId: 'akal-hub-10318',
    databaseURL: 'https://akal-hub-10318-default-rtdb.firebaseio.com',
    storageBucket: 'akal-hub-10318.appspot.com',
    iosBundleId: 'com.example.tryProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAndUdGj4t8Tldt2et2edu3mG9gkoAhZ_A',
    appId: '1:895079374528:ios:1eedb4feefec4c17ed9725',
    messagingSenderId: '895079374528',
    projectId: 'akal-hub-10318',
    databaseURL: 'https://akal-hub-10318-default-rtdb.firebaseio.com',
    storageBucket: 'akal-hub-10318.appspot.com',
    iosBundleId: 'com.example.tryProject.RunnerTests',
  );
}
