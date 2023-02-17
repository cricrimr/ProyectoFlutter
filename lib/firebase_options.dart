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
    apiKey: 'AIzaSyAe9mHRhI9_RdzrWHDPz3iCUukc2gSgM8o',
    appId: '1:514848127821:web:0268123f014e507a6b1504',
    messagingSenderId: '514848127821',
    projectId: 'flutter-proyecto-3f9fb',
    authDomain: 'flutter-proyecto-3f9fb.firebaseapp.com',
    storageBucket: 'flutter-proyecto-3f9fb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9VVe1VKSRBa7HjrWgski1TtIk7iN51kU',
    appId: '1:514848127821:android:df0197ef7b71a09e6b1504',
    messagingSenderId: '514848127821',
    projectId: 'flutter-proyecto-3f9fb',
    storageBucket: 'flutter-proyecto-3f9fb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRtxnSJMCd5UhiMyp1XvJsYym2I89NFKE',
    appId: '1:514848127821:ios:526a3712be6850a96b1504',
    messagingSenderId: '514848127821',
    projectId: 'flutter-proyecto-3f9fb',
    storageBucket: 'flutter-proyecto-3f9fb.appspot.com',
    iosClientId: '514848127821-3k9k1349dt6i8a8aqr7tkme95bhd61gl.apps.googleusercontent.com',
    iosBundleId: 'com.example.proyectoflutter2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCRtxnSJMCd5UhiMyp1XvJsYym2I89NFKE',
    appId: '1:514848127821:ios:526a3712be6850a96b1504',
    messagingSenderId: '514848127821',
    projectId: 'flutter-proyecto-3f9fb',
    storageBucket: 'flutter-proyecto-3f9fb.appspot.com',
    iosClientId: '514848127821-3k9k1349dt6i8a8aqr7tkme95bhd61gl.apps.googleusercontent.com',
    iosBundleId: 'com.example.proyectoflutter2',
  );
}
