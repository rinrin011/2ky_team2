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
    apiKey: 'AIzaSyBgH_k4Lyu51yBgP3QHorX2yWu7cdFCJYU',
    appId: '1:284507951589:web:73ef445c8f9110103bdf0c',
    messagingSenderId: '284507951589',
    projectId: 'sora-b23da',
    authDomain: 'sora-b23da.firebaseapp.com',
    databaseURL: 'https://sora-b23da-default-rtdb.firebaseio.com',
    storageBucket: 'sora-b23da.appspot.com',
    measurementId: 'G-W9ZQ3XPK4B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLIkoTQc1ljn-8OZr980khJzX0xH8g984',
    appId: '1:284507951589:android:66f28d7de8c2279c3bdf0c',
    messagingSenderId: '284507951589',
    projectId: 'sora-b23da',
    databaseURL: 'https://sora-b23da-default-rtdb.firebaseio.com',
    storageBucket: 'sora-b23da.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0ta8nLqtV0vxLOH2S7Qc3ZOIzAMltpmM',
    appId: '1:284507951589:ios:8fc5fbb3ee2c415d3bdf0c',
    messagingSenderId: '284507951589',
    projectId: 'sora-b23da',
    databaseURL: 'https://sora-b23da-default-rtdb.firebaseio.com',
    storageBucket: 'sora-b23da.appspot.com',
    iosClientId: '284507951589-jtlqkr5hoiafqss7ldkk0uagh2mj797f.apps.googleusercontent.com',
    iosBundleId: 'com.example.raisyu',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0ta8nLqtV0vxLOH2S7Qc3ZOIzAMltpmM',
    appId: '1:284507951589:ios:fb88cad7276250cb3bdf0c',
    messagingSenderId: '284507951589',
    projectId: 'sora-b23da',
    databaseURL: 'https://sora-b23da-default-rtdb.firebaseio.com',
    storageBucket: 'sora-b23da.appspot.com',
    iosClientId: '284507951589-f99vt2cad8obu0d5pub3fsfh0o487ho2.apps.googleusercontent.com',
    iosBundleId: 'com.example.raisyu.RunnerTests',
  );
}
