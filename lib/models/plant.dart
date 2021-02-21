import 'package:cloud_firestore/cloud_firestore.dart';

class Plant {
  String id;
  String user;
  String name;
  double waterLevel;
  DateTime createdAt;

  // number of times per day/week/month
  int frequencyCount;

  // the time period frequency is measured in
  Duration frequencyDuration;

  // how long the plant should grow for
  Duration growDuration;

  Plant(this.name, this.id, {
    double waterLevel,
    DateTime createdAt,
    this.user,
    this.frequencyCount,
    this.frequencyDuration,
    this.growDuration,
  }) :
  this.waterLevel = waterLevel == null ? 0 : waterLevel,
  this.createdAt = createdAt == null ? DateTime.now() : createdAt;

  double get waterIncrement => this.frequencyDuration.inSeconds / this.frequencyCount;
  int get maxWater => this.frequencyDuration.inSeconds;

  // height increments 24x per day
  int get heightIncrement => this.growDuration.inDays;
  int get maxHeight => this.growDuration.inHours;

  int get height {
    Duration growingFor = DateTime.now().difference(this.createdAt);
    return growingFor.inHours;
  }

  String get freqDurationName {
    switch (this.frequencyDuration.inDays) {
      case 30: return "Month";
      case 7: return "Week";
      default: return "Day";
    }
  }
//<<<<<<< HEAD
//   void feed(double foodCount) {
//     if (this.height < maxHeight) {
//       this.height += heightIncrement;
//     }
//     else {return;}
//   }

  void water(double waterAmount) {
    if (this.waterLevel < maxWater) {
      this.waterLevel += waterIncrement;
    }
    else {
      return;
    }
// =======
//
// >>>>>>> 43fd8ac32b178eeee0eeed715649fcc79dc694f2
  }

  Map<String, dynamic> toMap() => {
    'name': this.name,
    'user': this.user,
    'waterLevel': this.waterLevel,
    'createdAt': this.createdAt,
    'frequencyCount': this.frequencyCount,
    'frequencyDuration': this.frequencyDuration.inDays,
    'growDuration': this.growDuration.inDays,
  };

  Plant.fromDoc(DocumentSnapshot doc) : this(
    doc.get("name") as String,
    doc.id,
    waterLevel: doc.get("waterLevel") as double,
    createdAt: DateTime.fromMillisecondsSinceEpoch((doc.get("createdAt") as Timestamp).millisecondsSinceEpoch),
    frequencyCount: doc.get("frequencyCount") as int,
    frequencyDuration: Duration(days: doc.get("frequencyDuration") as int),
    growDuration: Duration(days: doc.get("growDuration") as int),
  );
}


class Vine extends Plant {
  String user;
  double _height;
  Duration unitTime; //unit of time in which to achieve sub-goal
  double unitGoal; //goal to be achieved in particular time unit
  double goalHeight; //height corresponding to cumulative goal
  DateTime createdAt;

  Vine(
    String name, 
    String id, 
    double height,
    this.createdAt,
    this.user,
    this.unitTime,
    this.unitGoal,
    this.goalHeight) :
  this._height = height,
  super(name, id);

  //grows vine according to unit goal, scaled up (or down) by the progress toward unitGoal
  void growVine(double goalProgress) {
    this._height += this.unitGoal * (goalProgress/this.unitGoal);
  }

  int get height => this._height.toInt();

  Map<String, dynamic> toMap() => {
    'name': this.name,
    'user': this.user,
    'unitTime': this.unitTime.inSeconds,
    'height': this.height,
    'createdAt': this.createdAt,
    'unitGoal': this.unitGoal,
    'goalHeight': this.goalHeight,
  };

  Vine.fromDoc(DocumentSnapshot doc) : this(
    doc.get("name") as String,
    doc.id,
    doc.get("height") as double,
    doc.get("createdAt") as DateTime,
    doc.get("user") as String,
    Duration(seconds: doc.get("unitTime") as int),
    doc.get("unitGoal") as double,
    doc.get("goalHeight") as double,
  );
}