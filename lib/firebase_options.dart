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
    apiKey: 'AIzaSyCY3ybTvEeRXY_j2GwJbMtGYk4F2hnl-cM',
    appId: '1:724164965314:web:590663b8c590634d731c5b',
    messagingSenderId: '724164965314',
    projectId: 'fit-help-app',
    authDomain: 'fit-help-app.firebaseapp.com',
    databaseURL:
        'https://fit-help-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fit-help-app.appspot.com',
    measurementId: 'G-WK8960XMTX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIEzZvMW1A-00ajlC2fhJnsjZpsvZJHFA',
    appId: '1:724164965314:android:59338a40727cbf12731c5b',
    messagingSenderId: '724164965314',
    projectId: 'fit-help-app',
    databaseURL:
        'https://fit-help-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fit-help-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBSrM3VIHiyjz2jrvA0BxznGeOw_ZFrzFM',
    appId: '1:724164965314:ios:c1c5cdf6d237e692731c5b',
    messagingSenderId: '724164965314',
    projectId: 'fit-help-app',
    databaseURL:
        'https://fit-help-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fit-help-app.appspot.com',
    iosClientId:
        '724164965314-l98d1m0ttk4tnt6dveqp60haas9rd2jp.apps.googleusercontent.com',
    iosBundleId: 'com.belajar.fitHelpApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBSrM3VIHiyjz2jrvA0BxznGeOw_ZFrzFM',
    appId: '1:724164965314:ios:c1c5cdf6d237e692731c5b',
    messagingSenderId: '724164965314',
    projectId: 'fit-help-app',
    databaseURL:
        'https://fit-help-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fit-help-app.appspot.com',
    iosClientId:
        '724164965314-l98d1m0ttk4tnt6dveqp60haas9rd2jp.apps.googleusercontent.com',
    iosBundleId: 'com.belajar.fitHelpApp',
  );
}
