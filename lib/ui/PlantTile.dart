import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';

class PlantTile extends StatelessWidget {
  final Plant plant;

  PlantTile(this.plant);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Icon(Icons.image),
        title: Text(plant.name),
        subtitle: Text(plant.createdAt.toString()),
        onTap: () {
          Navigator.of(context).pushNamed("/view-plant", arguments: plant);
        },
      ),
    );
  }
}