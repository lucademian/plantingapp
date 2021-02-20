import 'package:flutter/material.dart';
import 'package:plantingapp/notifiers/notifiers.dart';
import 'package:plantingapp/notifiers/user.dart';
import 'package:plantingapp/ui/MyAchievementsPage.dart';
import 'package:plantingapp/ui/MyPlantsPage.dart';
import 'package:plantingapp/ui/SplashScreenPage.dart';
import 'package:provider/provider.dart';

import 'MyVinesPage.dart';
import 'NoPlantsScreen.dart';
import 'PlantsList.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            MyPlantsPage(),
            MyVinesPage(),
            MyAchievementsPage()
          ],
        ),
        bottomNavigationBar: Material(
          color: Theme.of(context).colorScheme.primary,
          child: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.filter_vintage_rounded), child: Text('Plants')),
              Tab(icon: Icon(Icons.eco), child: Text('Vines')),
              Tab(icon: Icon(Icons.emoji_events_rounded), child: Text('Achievements')),
            ]
          ),
        ),
      ),
    );
  }
}