import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';

class LearnMorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.of(context).pop(),),
      ),
      body: Text("Learn more info page ..."),
    );
  }
}