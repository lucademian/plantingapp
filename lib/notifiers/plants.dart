import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:plantingapp/models/models.dart';

class PlantsModel extends ChangeNotifier {
  /// Internal, private state of the plants.
  final List<Plant> _plants = [];

  PlantsModel({List<Plant> plants}) {
    if (plants != null) {
      print(plants);
      this._plants.addAll(plants);
    }
  }
  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<Plant> get plants => UnmodifiableListView(_plants);

  /// The count of plants.
  int get plantCount => _plants.length;

  /// Adds [plant] to the list of plants.
  Future<void> add(Plant newPlant) async {
    Plant savedPlant = await addToFirebase(newPlant);

    this._plants.add(savedPlant);

    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  Future<Plant> addToFirebase(Plant newPlant) async {
    CollectionReference plants = FirebaseFirestore.instance.collection('plants');

    DocumentReference doc = await plants
        .add(newPlant.toMap());

    newPlant.id = doc.id;
    return newPlant;
  }

  /// Removes the plant with the given [id] from the list
  void removePlant(String id) {
    _plants.removeWhere((plant) => plant.id == id);
    notifyListeners();
  }

  static Future<List<Plant>> fetchPlants(String uid) async {
    CollectionReference plants = FirebaseFirestore.instance.collection('plants');
    List<Plant> plantList = [];

    QuerySnapshot snapshot = await plants.where("user", isEqualTo: uid).get();

    snapshot.docs.forEach((el) {
      plantList.add(Plant.fromDoc(el));
      print(el.id);
    });

    return plantList;
  }
}