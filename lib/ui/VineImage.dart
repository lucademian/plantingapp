import 'package:flutter/material.dart';

import '../models/plant.dart';

class VineImage extends StatelessWidget {
  final Vine vine;
  VineImage(this.vine);

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage('assets/plants/5.png'));
  }
}