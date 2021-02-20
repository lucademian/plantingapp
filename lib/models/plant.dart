import 'package:cloud_firestore/cloud_firestore.dart';

class Plant {
  String id;
  String user;
  String name;
  double height;
  double waterLevel;
  DateTime createdAt;

  // number of times per day/week/month
  int frequencyCount;

  // the time period frequency is measured in
  Duration frequencyDuration;

  // how long the plant should grow for
  Duration growDuration;

  Plant(this.name, this.id, {
    double height,
    double waterLevel,
    DateTime createdAt,
    this.user,
    this.frequencyCount,
    this.frequencyDuration,
    this.growDuration,
  }) :
  this.height = height == null ? 0 : height,
  this.waterLevel = waterLevel == null ? 0 : waterLevel,
  this.createdAt = createdAt == null ? DateTime.now() : createdAt;
  
  double get waterIncrement => this.frequencyDuration.inSeconds / this.frequencyCount;
  int get maxWater => this.frequencyDuration.inSeconds;
  
  // height increments 24x per day
  int get heightIncrement => this.growDuration.inDays;
  int get maxHeight => this.growDuration.inHours;
  String get freqDurationName {
    switch (this.frequencyDuration.inDays) {
      case 30: return "Month";
      case 7: return "Week";
      default: return "Day";
    }
  }
  void feed(double foodCount) {
    this.height += heightIncrement;
  }

  void water(double waterAmount) {
    this.waterLevel += waterIncrement;
  }

  Map<String, dynamic> toMap() => {
    'name': this.name,
    'user': this.user,
    'waterLevel': this.waterLevel,
    'height': this.height,
    'createdAt': this.createdAt,
    'frequencyCount': this.frequencyCount,
    'frequencyDuration': this.frequencyDuration.inDays,
    'growDuration': this.growDuration.inDays,
  };

  static Plant fromDoc(DocumentSnapshot doc) => Plant(
    doc.get("name") as String,
    doc.id,
    height: doc.get("height") as double,
    waterLevel: doc.get("waterLevel") as double,
    createdAt: DateTime.fromMillisecondsSinceEpoch((doc.get("createdAt") as Timestamp).millisecondsSinceEpoch),
    frequencyCount: doc.get("frequencyCount") as int,
    frequencyDuration: Duration(days: doc.get("frequencyDuration") as int),
    growDuration: Duration(days: doc.get("growDuration") as int),
  );
}
