import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:plantingapp/models/models.dart';

abstract class PlantsModel<T extends Plant> extends ChangeNotifier {
  /// Internal, private state of the plants.
  final List<T> _plants = [];
  final String collectionName;

  PlantsModel(this.collectionName, {List<T> plants}) {
    if (plants != null) {
      print(plants);
      this._plants.addAll(plants);
    }
  }
  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<T> get plants => UnmodifiableListView(_plants);

  /// The count of plants.
  int get plantCount => _plants.length;

  /// Adds [plant] to the list of plants.
  Future<void> add(T newPlant) async {
    T savedPlant = await addToFirebase(newPlant, this.collectionName);

    this._plants.add(savedPlant);

    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  Future<Plant> addToFirebase(T newPlant, String collectionName) async {
    CollectionReference plants = FirebaseFirestore.instance.collection(collectionName);

    DocumentReference doc = await plants.add(newPlant.toMap());

    newPlant.id = doc.id;
    return newPlant;
  }

  /// Removes the plant with the given [id] from the list
  void removePlant(String id) {
    _plants.removeWhere((plant) => plant.id == id);
    notifyListeners();
  }

  Future<void> fetch(String uid) async {
    CollectionReference plants = FirebaseFirestore.instance.collection(this.collectionName);
    List<T> plantList = [];

    QuerySnapshot snapshot = await plants.where("user", isEqualTo: uid).get();

    snapshot.docs.forEach((el) {
      plantList.add(this.doc2Object(el));
    });
    
    this._plants.clear();
    this._plants.addAll(plantList);
  }

  T doc2Object(DocumentSnapshot doc);
}

class PlantNotifier extends PlantsModel<Plant> {
  PlantNotifier({List<Plant> plants}) : 
  super("plants", plants: plants);

  @override
  Plant doc2Object(DocumentSnapshot doc) {
    return Plant.fromDoc(doc);
  }
}

class VineNotifier extends PlantsModel<Vine> {
  VineNotifier({List<Vine> vines}) : 
  super("vines", plants: vines);

  @override
  Vine doc2Object(DocumentSnapshot doc) {
    return Vine.fromDoc(doc);
  }
}