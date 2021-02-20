import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';
import 'package:plantingapp/notifiers/notifiers.dart';
import 'package:plantingapp/ui/PlantsList.dart';
import 'package:provider/provider.dart';

import 'NoPlantsScreen.dart';
import 'NoVinesScreen.dart';
import 'VinesList.dart';

class MyVinesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<VineNotifier>(
      builder: (context, vines, child) {
        if (vines.plantCount == 0) {
          return NoVinesScreen();
        }
        else {
          return VinesList(vines.plants);
        }
      },
    );
  }
}