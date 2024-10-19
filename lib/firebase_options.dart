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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAxDiPz2vM_YNtIvSbeSJRgd2BIHmuGKWE',
    appId: '1:130485921797:web:0116fe81bf3b5a0759d46c',
    messagingSenderId: '130485921797',
    projectId: 'chatmindset',
    authDomain: 'chatmindset.firebaseapp.com',
    databaseURL: 'https://chatmindset-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'chatmindset.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDT1mrnmj3a_XUYCjK2jXh1KuAbLGmxO8Q',
    appId: '1:130485921797:android:1a3b90284f3f84f559d46c',
    messagingSenderId: '130485921797',
    projectId: 'chatmindset',
    databaseURL: 'https://chatmindset-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'chatmindset.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZcm7STnVHB7fOQXfbTZzrIak6QtNsQLs',
    appId: '1:130485921797:ios:a70d26a16d56be7659d46c',
    messagingSenderId: '130485921797',
    projectId: 'chatmindset',
    databaseURL: 'https://chatmindset-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'chatmindset.appspot.com',
    iosBundleId: 'com.example.chatMindest',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAxDiPz2vM_YNtIvSbeSJRgd2BIHmuGKWE',
    appId: '1:130485921797:web:6c6191ad7d55d9b159d46c',
    messagingSenderId: '130485921797',
    projectId: 'chatmindset',
    authDomain: 'chatmindset.firebaseapp.com',
    databaseURL: 'https://chatmindset-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'chatmindset.appspot.com',
  );
}