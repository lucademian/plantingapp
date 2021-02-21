import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SolidButton.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
            IconButton(
              icon: Image.asset('assets/danger.png'),
              iconSize: 150,
              onPressed: () {
              },
            ),
        );
  }
  
}