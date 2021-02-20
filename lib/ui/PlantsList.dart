import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';
import 'package:plantingapp/ui/SolidButton.dart';

class PlantsList extends StatelessWidget {
  final UnmodifiableListView<Plant> _plants;
  
  PlantsList(UnmodifiableListView<Plant> plants) : _plants = plants;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _plants.length + 1,
      itemBuilder: (context, idx) {
        if (idx == 0) {
          return SolidButton(
            "Grow a New Plant", 
            theme: SolidButtonTheme.green,
            onPressed: () => {
              Navigator.of(context).pushNamed("/new-plant")
            },
          );
        }

        Plant thisPlant = _plants[idx - 1];
        return Container(
          child: Text(thisPlant.id)
        );
      }
    );
  }  
}
