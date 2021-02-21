import 'package:flutter/material.dart';
import 'package:plantingapp/models/models.dart';
import 'VineImage.dart';

class ViewVinePage extends StatelessWidget {
  final Vine vine;
  
  ViewVinePage(this.vine);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.of(context).pop(),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            VineImage(this.vine),
            IconButton(
              icon: Image.asset('assets/waterPitcherWithFlower.PNG'),
              iconSize: 150,
              onPressed: () {
              },
            )
          ],
        ),
      ),
    );
  }
}