import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';

import 'SolidButton.dart';

class LearnMorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.of(context).pop(),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text("Plant: select a small achievement you want to commit to "
                  + "everyday :) Tap on the pitcher every time you accomplished"
                  + "the task to keep track of your porgress!",
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.center,),
            Text("Vine: select a formidable goal you aspire to take on"
                  + "and we will help break it down into what you "
                  + "should do day by day!",
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.center,),
            Text("You can see all your accomplished acheivements and "
                  + "challenges in the Acheivements Page!",
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.center,),
            SolidButton(
              "Home",
              theme: SolidButtonTheme.brown,
              onPressed: () => {
                Navigator.of(context).pushNamed("/home")
              },
            ),
          ],
        ),
      ),
    );
  }
}