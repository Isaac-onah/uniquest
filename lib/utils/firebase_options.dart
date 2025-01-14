// // File generated by FlutterFire CLI.
// // ignore_for_file: type=lint
// import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
// import 'package:flutter/foundation.dart'
//     show defaultTargetPlatform, kIsWeb, TargetPlatform;
//
// /// Default [FirebaseOptions] for use with your Firebase apps.
// ///
// /// Example:
// /// ```dart
// /// import 'firebase_options.dart';
// /// // ...
// /// await Firebase.initializeApp(
// ///   options: DefaultFirebaseOptions.currentPlatform,
// /// );
// /// ```
// class DefaultFirebaseOptions {
//   static FirebaseOptions get currentPlatform {
//     if (kIsWeb) {
//       return web;
//     }
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.android:
//         return android;
//       case TargetPlatform.iOS:
//         return ios;
//       case TargetPlatform.macOS:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for macos - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       case TargetPlatform.windows:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for windows - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       case TargetPlatform.linux:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for linux - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       default:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions are not supported for this platform.',
//         );
//     }
//   }
//
//   static const FirebaseOptions web = FirebaseOptions(
//     apiKey: 'AIzaSyBZ2uG7I35EsFZMsjSQGkSGso5YnEYKMo4',
//     appId: '1:118479772966:web:437028b8cd3cbbf99175e7',
//     messagingSenderId: '118479772966',
//     projectId: 'foodie-58641',
//     authDomain: 'foodie-58641.firebaseapp.com',
//     storageBucket: 'foodie-58641.appspot.com',
//     measurementId: 'G-QS5C9W3WTE',
//   );
//
//   static const FirebaseOptions android = FirebaseOptions(
//     apiKey: 'AIzaSyAs58GZw9Cx-EM_YNZNW54rD4YzivgogNI',
//     appId: '1:118479772966:android:b41a0ba79d041b749175e7',
//     messagingSenderId: '118479772966',
//     projectId: 'foodie-58641',
//     storageBucket: 'foodie-58641.appspot.com',
//   );
//
//   static const FirebaseOptions ios = FirebaseOptions(
//     apiKey: 'AIzaSyAUfw4n_xjEnq_snfuVHql04KMofL2Uhz4',
//     appId: '1:118479772966:ios:ac88a7fad218c50f9175e7',
//     messagingSenderId: '118479772966',
//     projectId: 'foodie-58641',
//     storageBucket: 'foodie-58641.appspot.com',
//     androidClientId: '118479772966-hsmincvp7k890rvrs1g65o529milphph.apps.googleusercontent.com',
//     iosClientId: '118479772966-8beoa69emv9vaf7pes9qmjchve5e41k8.apps.googleusercontent.com',
//     iosBundleId: 'com.isaaconah.foodie',
//   );
//
// }