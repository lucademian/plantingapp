import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';

class PlantsList extends StatelessWidget {
  final UnmodifiableListView<Plant> _plants;
  
  PlantsList(UnmodifiableListView<Plant> plants) : _plants = plants;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _plants.length,
      itemBuilder: (context, idx) {
        Plant thisPlant = _plants[idx];
        return Container(
          child: Text(thisPlant.id)
        );
      }
    );
  }  
}
