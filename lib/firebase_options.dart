// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAVKv13lIth6sAcwNWYKIbbRgZLPAveOd0',
    appId: '1:468737726872:web:1bacf0f502540a1bfe33ed',
    messagingSenderId: '468737726872',
    projectId: 'products-6df95',
    authDomain: 'products-6df95.firebaseapp.com',
    storageBucket: 'products-6df95.appspot.com',
    measurementId: 'G-8XW857HNCB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDi56d13aR-oc2GhfQ3GKvqSudqDUNUJQA',
    appId: '1:468737726872:android:7647f7f6add8fcfcfe33ed',
    messagingSenderId: '468737726872',
    projectId: 'products-6df95',
    storageBucket: 'products-6df95.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEgB_YFoDP2YWnjLMqLl7OVXLsl8P6Zyc',
    appId: '1:468737726872:ios:cbd3877bf9e96e4afe33ed',
    messagingSenderId: '468737726872',
    projectId: 'products-6df95',
    storageBucket: 'products-6df95.appspot.com',
    iosBundleId: 'com.example.productsTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAEgB_YFoDP2YWnjLMqLl7OVXLsl8P6Zyc',
    appId: '1:468737726872:ios:cbd3877bf9e96e4afe33ed',
    messagingSenderId: '468737726872',
    projectId: 'products-6df95',
    storageBucket: 'products-6df95.appspot.com',
    iosBundleId: 'com.example.productsTask',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAVKv13lIth6sAcwNWYKIbbRgZLPAveOd0',
    appId: '1:468737726872:web:2cd5e92702b925dafe33ed',
    messagingSenderId: '468737726872',
    projectId: 'products-6df95',
    authDomain: 'products-6df95.firebaseapp.com',
    storageBucket: 'products-6df95.appspot.com',
    measurementId: 'G-0SW2GPZFPJ',
  );

}