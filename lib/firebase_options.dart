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
    apiKey: 'AIzaSyB6L78_uXPw5HiWuTYYm9XIxpcPUQMex4w',
    appId: '1:31381325419:web:ef5dbb1a289d4d100ad32e',
    messagingSenderId: '31381325419',
    projectId: 'patofy-db-auth',
    authDomain: 'patofy-db-auth.firebaseapp.com',
    storageBucket: 'patofy-db-auth.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXCp_0LIvq---dsuCITwNIaciSqaZw1aw',
    appId: '1:31381325419:android:624c75532b7491240ad32e',
    messagingSenderId: '31381325419',
    projectId: 'patofy-db-auth',
    storageBucket: 'patofy-db-auth.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6Z8ZGfcrL8wKE5DBdGf7jBLS6laxmorI',
    appId: '1:31381325419:ios:8f955a174f6021e40ad32e',
    messagingSenderId: '31381325419',
    projectId: 'patofy-db-auth',
    storageBucket: 'patofy-db-auth.appspot.com',
    iosClientId: '31381325419-g35gcdccebs0stt1t3dh69635vqpthlt.apps.googleusercontent.com',
    iosBundleId: 'com.example.patofy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB6Z8ZGfcrL8wKE5DBdGf7jBLS6laxmorI',
    appId: '1:31381325419:ios:38acf50ff927df7b0ad32e',
    messagingSenderId: '31381325419',
    projectId: 'patofy-db-auth',
    storageBucket: 'patofy-db-auth.appspot.com',
    iosClientId: '31381325419-2rc1iqh62gv6muun9d7pickolaifur6t.apps.googleusercontent.com',
    iosBundleId: 'com.example.patofy.RunnerTests',
  );
}
