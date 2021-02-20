import 'package:flutter/material.dart';
import 'package:plantingapp/notifiers/notifiers.dart';
import 'package:provider/provider.dart';

import 'NoPlantsScreen.dart';
import 'PlantsList.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => PlantsModel(),
        child: Consumer<PlantsModel>(
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
        )
      ),
    );
  }
}