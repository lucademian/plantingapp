import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';
import 'package:plantingapp/ui/SolidButton.dart';

import 'PlantTile.dart';

class VinesList extends StatelessWidget {
  final UnmodifiableListView<Vine> vines;
  
  VinesList(this.vines);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vines.length + 1,
      itemBuilder: (context, idx) {
        if (idx == 0) {
          return SolidButton(
            "Grow a New Vine", 
            theme: SolidButtonTheme.green,
            onPressed: () => {
              Navigator.of(context).pushNamed("/new-plant")
            },
          );
        }
        Vine thisVine = vines[idx - 1];
        // TODO vine tile
        return PlantTile(thisVine);
      }
    );
  }  
}
