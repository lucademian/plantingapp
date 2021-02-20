import 'package:cloud_firestore/cloud_firestore.dart';

class Plant {
  String id;
  String user;
  String name;
  double height;
  double waterLevel;
  DateTime createdAt;

  Plant(this.name, this.id, {
    double height,
    double waterLevel,
    DateTime createdAt,
    this.user,
  }) :
  this.height = height == null ? 0 : height,
  this.waterLevel = waterLevel == null ? 0 : waterLevel,
  this.createdAt = createdAt == null ? DateTime.now() : createdAt;

  void feed(double foodCount) {
    this.height += 10;
  }

  void water(double waterAmount) {
    this.waterLevel += 10;
  }

  static Plant fromDoc(DocumentSnapshot doc) => Plant(
    doc.get("name") as String,
    doc.id,
    height: doc.get("height") as double,
    waterLevel: doc.get("waterLevel") as double,
    createdAt: DateTime.fromMillisecondsSinceEpoch((doc.get("createdAt") as Timestamp).millisecondsSinceEpoch),
  );
}
