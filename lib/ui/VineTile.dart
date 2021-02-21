import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';

import 'PlantImage.dart';

class VineTile extends StatelessWidget {
  final Vine vine;

  VineTile(this.vine);

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
          leading: PlantImage(this.vine),
          title: Text(vine.name),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Icon(Icons.opacity),
                Icon(Icons.av_timer),
                Text(vine.goalHeight.toString() + " end goal."),
              ],
            ),
          ),
          onTap: () {
            // Navigator.of(context).pushNamed("/view-vine", arguments: vine);
            Navigator.of(context).pushNamed("/view-vine", arguments: vine);
          },
        )
      )
    );
  }
}