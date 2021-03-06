import 'package:flutter/material.dart';
import 'package:plantingapp/app/colors.dart';

enum SolidButtonTheme {
  green, brown
}

// represents a standard filled button with the given theme and text
class SolidButton extends StatelessWidget {
  final String text;
  final SolidButtonTheme theme;
  final Function() onPressed;
  final double width;

  SolidButton(this.text, {
    this.theme = SolidButtonTheme.green,
    this.onPressed,
    this.width = -1,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: this.onPressed, 
      child: Text(this.text),
      textColor: this._getTextColor(),
      color: this._getButtonColor(),
      minWidth: this.width < 0 ? MediaQuery.of(context).size.width - 200 : this.width,
    );
  }

  Color _getButtonColor() {
    if (this.theme == SolidButtonTheme.green) {
      return PlantingColors.lightGreen;
    }
    else if (this.theme == SolidButtonTheme.brown) {
      return PlantingColors.lightBrown;
    }
    return PlantingColors.lightGreen;
  }

  Color _getTextColor() {
    if (this.theme == SolidButtonTheme.green) {
      return PlantingColors.darkGreen;
    }
    else if (this.theme == SolidButtonTheme.brown) {
      return PlantingColors.darkBrown;
    }
    return PlantingColors.darkGreen;
  }
}