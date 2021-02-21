import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';
import 'package:plantingapp/ui/SolidButton.dart';

import 'PlantTile.dart';

class PlantsList extends StatelessWidget {
  final UnmodifiableListView<Plant> plants;
  
  PlantsList(this.plants);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: plants.length + 1,
      itemBuilder: (context, idx) {
        if (idx == 0) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Text("My Plants", style: Theme.of(context).textTheme.headline1,),
              ),
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                width: MediaQuery.of(context).size.width - 100,
                child: SolidButton(
                  "Grow a New Plant",
                  theme: SolidButtonTheme.green,
                  onPressed: () => {
                    Navigator.of(context).pushNamed("/new-plant")
                  },
                ),
              ),
            ],
          );
        }
        Plant thisPlant = plants[idx - 1];
        return PlantTile(thisPlant);
      }
    );
  }  
}
