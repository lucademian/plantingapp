import 'package:flutter/material.dart';

import '../models/plant.dart';

class PlantImage extends StatelessWidget {
  final Plant plant;
  PlantImage(this.plant);

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage('assets/plants/' + ((this.plant.height / this.plant.maxHeight * 16).toInt()).toString() + '.png'));
  }
}