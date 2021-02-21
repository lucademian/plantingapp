
import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';
import 'package:plantingapp/notifiers/notifiers.dart';
import 'package:plantingapp/ui/SolidButton.dart';
import 'package:provider/provider.dart';

class NoVinesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Planting Your Life",
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          Text(
            "Starts Here",
            style: Theme.of(context).textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
          SolidButton(
            "Grow Your First Vine", 
            theme: SolidButtonTheme.green,
            onPressed: () => {
              Navigator.of(context).pushNamed("/new-vine")
            },
          ),
          SolidButton(
            "Learn More", 
            theme: SolidButtonTheme.brown,
            onPressed: () => {
              Navigator.of(context).pushNamed("/Learn-more")
            },
          )
        ],
      ),
    );
  }
  
}