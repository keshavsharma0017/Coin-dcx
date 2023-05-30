// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
// import 'package:firebase_core/firfluttebase_core.dart' show FirebaseOptions;
import 'package:firebase_core/firebase_core.dart';
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
    apiKey: 'AIzaSyDEAaKzbBKKIikwaUUtFSIm57Du_kZAA1c',
    appId: '1:260131588892:web:5975c65fa85eee5152c8d9',
    messagingSenderId: '260131588892',
    projectId: 'coin-dcx-clone',
    authDomain: 'coin-dcx-clone.firebaseapp.com',
    storageBucket: 'coin-dcx-clone.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_ijJRjryAA0xu4TlRITO9KN5hJdgTxi0',
    appId: '1:260131588892:android:8fc3b1db5dab743452c8d9',
    messagingSenderId: '260131588892',
    projectId: 'coin-dcx-clone',
    storageBucket: 'coin-dcx-clone.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABrVoT-zFHJkRKvl9gjruWGo6JAARVBiE',
    appId: '1:260131588892:ios:396ed2b5355c89d852c8d9',
    messagingSenderId: '260131588892',
    projectId: 'coin-dcx-clone',
    storageBucket: 'coin-dcx-clone.appspot.com',
    iosClientId: '260131588892-fcbqgbrhautcd10508tg02ucg8r0j0ot.apps.googleusercontent.com',
    iosBundleId: 'com.example.coindcx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyABrVoT-zFHJkRKvl9gjruWGo6JAARVBiE',
    appId: '1:260131588892:ios:396ed2b5355c89d852c8d9',
    messagingSenderId: '260131588892',
    projectId: 'coin-dcx-clone',
    storageBucket: 'coin-dcx-clone.appspot.com',
    iosClientId: '260131588892-fcbqgbrhautcd10508tg02ucg8r0j0ot.apps.googleusercontent.com',
    iosBundleId: 'com.example.coindcx',
  );
}