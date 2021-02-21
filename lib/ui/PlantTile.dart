import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';

class PlantTile extends StatelessWidget {
  final Plant plant;

  PlantTile(this.plant);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Image(image: AssetImage('assets/plants/' + ((this.plant.height / this.plant.maxHeight * 16).toInt()).toString() + '.png')),
        title: Text(plant.name),
        subtitle: Text(plant.createdAt.toString()),
        onTap: () {
          Navigator.of(context).pushNamed("/view-plant", arguments: plant);
        },
      ),
    );
  }
}