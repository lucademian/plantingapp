import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';

import 'PlantImage.dart';

class ViewPlantPage extends StatelessWidget {
  final Plant plant;
  
  ViewPlantPage(this.plant);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.of(context).pop(),),
      ),
      body: Column(
        children: [
          PlantImage(this.plant),
          Text("NAME: " + plant.name),
          Text("WATER: " + plant.frequencyCount.toString() + " times every " + plant.freqDurationName),
          Text("GROWING FOR: " + plant.growDuration.inDays.toString() + " days"),
        ],
      ),
    );
  }
}