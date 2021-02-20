import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // simulated loading for now
    Future.delayed(Duration(seconds: 1), () => Navigator.of(context).pushNamed("/home"));
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("LOGO HERE"),
        ],
      ),
    );
  }
  
}