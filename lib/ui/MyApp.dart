import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantingapp/app/routes.dart';
import 'package:plantingapp/app/theme.dart';
import 'package:plantingapp/notifiers/notifiers.dart';
import 'package:plantingapp/notifiers/user.dart';
import 'package:provider/provider.dart';

import 'SplashScreenPage.dart';

class MyApp extends StatelessWidget {
  final UserCredential currentUser;

  MyApp(this.currentUser);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PlantNotifier()),
        ChangeNotifierProvider(create: (context) => VineNotifier()),
        Provider(create: (context) => AnonUserInfo(this.currentUser.user.uid)),
      ],
      builder: (context, child) => FutureBuilder(
        future: Future.wait([
          Provider.of<PlantNotifier>(context).fetch(Provider.of<AnonUserInfo>(context).uid),
          Provider.of<VineNotifier>(context).fetch(Provider.of<AnonUserInfo>(context).uid),
        ]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
              title: 'Planttracker',
              theme: plantingTheme,
              initialRoute: "/home",
              onGenerateRoute: PageRoutes.onGenerateRoute,
            );
          }
          return SplashScreenPage();
        }
      ),
    );
  }
}