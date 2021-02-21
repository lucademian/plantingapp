import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';

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
          Text("NAME: " + plant.name),
          Text("WATER: " + plant.frequencyCount.toString() + " times every " + plant.freqDurationName),
          Text("GROWING FOR: " + plant.growDuration.inDays.toString() + " days"),
          IconButton(
            icon: Image.asset('assets/garden_pitcher.png'),
            iconSize: 50,
            onPressed: () {},
          )

        ],
      ),
    );
  }
}