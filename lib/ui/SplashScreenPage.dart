import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SolidButton.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Image.asset('assets/danger.png'),

        ],
      ),
    );
  }
  
}