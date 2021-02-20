import 'package:flutter/material.dart';
import 'package:plantingapp/notifiers/notifiers.dart';
import 'package:plantingapp/ui/PlantsList.dart';
import 'package:provider/provider.dart';

import 'NoPlantsScreen.dart';

class MyPlantsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlantNotifier>(
      // This function will be called every time the PlantsModel calls
      // notifyListeners()
      builder: (context, plants, child) {
        if (plants.plantCount == 0) {
          return NoPlantsScreen();
        }
        else {
          return PlantsList(plants.plants);
        }
      },
    );
  }
}