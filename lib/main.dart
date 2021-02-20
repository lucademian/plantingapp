import 'package:flutter/material.dart';
import 'package:plantingapp/app/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plantingapp/ui/SplashScreenPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'app/theme.dart';
import 'ui/HomePage.dart';
import 'ui/MyApp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(InitApp());
}

class InitApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          // TODO handle error
          // return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          Future<UserCredential> userCredential = FirebaseAuth.instance.signInAnonymously();
          return FutureBuilder(
            future: userCredential,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return MyApp(snapshot.data);
              }
              else {
                return SplashScreenPage();
              }
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return SplashScreenPage();
      },
    );
  }
}
