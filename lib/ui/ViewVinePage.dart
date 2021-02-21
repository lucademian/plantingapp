import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';

class ViewVinePage extends StatelessWidget {
  final Vine vine;
  
  ViewVinePage(this.vine);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.of(context).pop(),),
      ),
      body: Column(
        children: [
          Text("NAME: " + vine.name),
          // Text("WATER: " + plant.frequencyCount.toString() + " times every " + plant.freqDurationName),
          // Text("GROWING FOR: " + plant.growDuration.inDays.toString() + " days"),
        ],
      ),
    );
  }
}