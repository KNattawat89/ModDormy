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
    apiKey: 'AIzaSyCsbuFphWmZ1DtV8nETRLskje2WtM9fi_g',
    appId: '1:183482773888:web:7dadabd8a06970e8ab5165',
    messagingSenderId: '183482773888',
    projectId: 'flutter-app-test-a2abf',
    authDomain: 'flutter-app-test-a2abf.firebaseapp.com',
    storageBucket: 'flutter-app-test-a2abf.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDteEOKB-0ANjCaO_oHLTsAbdCxV_Uik1o',
    appId: '1:183482773888:android:0f0ed77b43f126b9ab5165',
    messagingSenderId: '183482773888',
    projectId: 'flutter-app-test-a2abf',
    storageBucket: 'flutter-app-test-a2abf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQ33aRK73b4L7anc2cdTzoJI6myZMipAA',
    appId: '1:183482773888:ios:6356b9a7b9e0019bab5165',
    messagingSenderId: '183482773888',
    projectId: 'flutter-app-test-a2abf',
    storageBucket: 'flutter-app-test-a2abf.appspot.com',
    iosClientId: '183482773888-d2eii6ee4um0s4hnra6ajkar2tl58o2p.apps.googleusercontent.com',
    iosBundleId: 'com.example.moddormyFlutter',
  );
}