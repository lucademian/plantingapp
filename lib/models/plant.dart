import 'package:cloud_firestore/cloud_firestore.dart';

class Plant {
  String id;
  String user;
  String name;
  double height;
  double waterLevel;
  DateTime createdAt;
  double waterIncrement;
  double heightIncrement;
  double maxWater;
  double maxHeight;

  //number of seconds per unit of time indicated
  final hour = 60 * 60;
  final day = 1440 * 60;
  final week = 10080 * 60;
  final month = day * 30 * 60; // 30 days for simplicity
  final year = day * 356 * 60;

  Plant(this.name, this.id, {
    double height,
    double waterLevel,
    DateTime createdAt,
    this.user,
    int frequency,
    String unitOfFrequency,
    int freqOfDuration,
    String unitOfDuration,
  }) :
  this.height = height == null ? 0 : height,
  this.waterLevel = waterLevel == null ? 0 : waterLevel,
  this.createdAt = createdAt == null ? DateTime.now() : createdAt;
  // update the amount of taps on water the user need in order to
  // incremet height
  switch(unitOfFrequency) {
  case "hour": {
  this.waterIncrement = hour / frequency;
  this.maxWater = hour;
  break;
  }
  case "day": {
  this.waterIncrement = day / frequency;
  this.maxWater = day;
  break;
  }
  case "week": {
  this.waterIncrement = week / frequency;
  this.maxWater = week;
  break;
  }
  case "month": {
  this.waterIncrement = month / frequency;
  this.maxWater = month;
  break;
  }
  case "year": {
  this.waterIncrement = year / frequency;
  this.maxWater = year;
  break;
  }
  default: {
  this.waterIncrement = day / frequency;
  this.maxWater = day;
  break;
  }
  }

  // update the times that height need to be incremented to reach the ultimate
  // goal
  switch(unitOfDuration) {
  case "hour": {
  this.heightIncrement = (freqOfDuration * hour) / freqOfDuration;
  this.maxHeight = hour;
  }
  break;
  case "day": {
  this.heightIncrement = (freqOfDuration * day) / freqOfDuration;
  this.maxHeight = day;
  }
  break;
  case "week": {
  this.heightIncrement = (freqOfDuration * week) / freqOfDuration;
  this.maxHeight = week;
  }
  break;
  case "month": {
  this.heightIncrement = (freqOfDuration * month) / freqOfDuration;
  this.maxHeight = month;
  }
  break;
  case "year": {
  this.heightIncrement = (freqOfDuration * year) / freqOfDuration;
  this.maxHeight = year;
  }
  break;
  default: {
  this.heightIncrement = (freqOfDuration * day) / freqOfDuration;
  this.maxHeight = day;
  }
  break;
  }

  void feed(double foodCount) {
    this.height += heightIncrement;
  }

  void water(double waterAmount) {
    this.waterLevel += waterIncrement;
  }

  static Plant fromDoc(DocumentSnapshot doc) => Plant(
    doc.get("name") as String,
    doc.id,
    height: doc.get("height") as double,
    waterLevel: doc.get("waterLevel") as double,
    createdAt: DateTime.fromMillisecondsSinceEpoch((doc.get("createdAt") as Timestamp).millisecondsSinceEpoch),
  );
}
