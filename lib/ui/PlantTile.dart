import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';

import 'PlantImage.dart';

class PlantTile extends StatelessWidget {
  final Plant plant;

  PlantTile(this.plant);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: ListTile(
          leading: PlantImage(this.plant),
          title: Text(plant.name),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Icon(Icons.opacity),
                Text((plant.waterLevel ~/ plant.maxWater).toString() + "%"),
                Icon(Icons.av_timer),
                Text(((plant.waterLevel ~/ plant.waterIncrement) * plant.frequencyDuration.inDays).toString() + " days to empty"),
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamed("/view-plant", arguments: plant);
          },
        )
      )
    );
  }
}