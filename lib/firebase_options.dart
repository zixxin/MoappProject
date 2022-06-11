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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxiTPEG4WiIPi207zLMD7fABfCsuh5eSg',
    appId: '1:1077164456115:android:a1c5a19a06df5d4a1518c6',
    messagingSenderId: '1077164456115',
    projectId: 'test1-148dd',
    storageBucket: 'test1-148dd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1ojw0nAGEJp3eBnbL1TXFQ1FjxYrjO5g',
    appId: '1:1077164456115:ios:9de2ed4e02443ca51518c6',
    messagingSenderId: '1077164456115',
    projectId: 'test1-148dd',
    storageBucket: 'test1-148dd.appspot.com',
    androidClientId: '1077164456115-h92fqjbki3qvhtl5ulvb96vojl3drf6t.apps.googleusercontent.com',
    iosClientId: '1077164456115-f4uncdno32f8f20egh7chggjc8npa2tk.apps.googleusercontent.com',
    iosBundleId: 'com.example.temp',
  );
}
