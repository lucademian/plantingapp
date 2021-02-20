
import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';
import 'package:plantingapp/notifiers/notifiers.dart';
import 'package:plantingapp/ui/SolidButton.dart';
import 'package:provider/provider.dart';

class NoPlantsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "App Name Here",
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          Text(
            "Some kind of tagline maybe",
            style: Theme.of(context).textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
          SolidButton(
            "Grow Your First Plant", 
            theme: SolidButtonTheme.green,
            onPressed: () => {
              Navigator.of(context).pushNamed("/new-plant")
            },
          ),
          SolidButton(
            "Learn More", 
            theme: SolidButtonTheme.brown,
            onPressed: () => {
            },
          )
        ],
      ),
    );
  }
  
}