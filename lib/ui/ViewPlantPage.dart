import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';

class ViewPlantPage extends StatelessWidget {
  final Plant plant;
  
  ViewPlantPage(this.plant);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.of(context).pop(),),
      ),
      body: Text(plant.name),
    );
  }
}