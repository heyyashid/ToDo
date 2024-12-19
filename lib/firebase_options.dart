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
    apiKey: 'AIzaSyCle0X77ayMNWzheGXODMMxza-8pNNPS9w',
    appId: '1:879442754306:web:313c7af64a1b6e28aba01b',
    messagingSenderId: '879442754306',
    projectId: 'fir-demo-13876',
    authDomain: 'fir-demo-13876.firebaseapp.com',
    storageBucket: 'fir-demo-13876.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzVz-jgajhrDwh1e-TyC54lldeCA6dR40',
    appId: '1:879442754306:android:0f9f27caeb9b3a85aba01b',
    messagingSenderId: '879442754306',
    projectId: 'fir-demo-13876',
    storageBucket: 'fir-demo-13876.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB4VPH6FSw2dFMBtCZPvJcp0BhUfBQjXJQ',
    appId: '1:879442754306:ios:3319b508eca7253faba01b',
    messagingSenderId: '879442754306',
    projectId: 'fir-demo-13876',
    storageBucket: 'fir-demo-13876.firebasestorage.app',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB4VPH6FSw2dFMBtCZPvJcp0BhUfBQjXJQ',
    appId: '1:879442754306:ios:3319b508eca7253faba01b',
    messagingSenderId: '879442754306',
    projectId: 'fir-demo-13876',
    storageBucket: 'fir-demo-13876.firebasestorage.app',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDru35GStIF8WGtqfeFSoZVK-DqsU7-lkU',
    appId: '1:879442754306:web:216f813d6519c59daba01b',
    messagingSenderId: '879442754306',
    projectId: 'fir-demo-13876',
    authDomain: 'fir-demo-13876.firebaseapp.com',
    storageBucket: 'fir-demo-13876.firebasestorage.app',
  );
}