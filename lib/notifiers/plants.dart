import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:plantingapp/models/models.dart';

class PlantsModel extends ChangeNotifier {
  /// Internal, private state of the plants.
  final List<Plant> _plants = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<Plant> get plants => UnmodifiableListView(_plants);

  /// The count of plants.
  int get plantCount => _plants.length;

  /// Adds [plant] to the list of plants.
  void add(Plant newPlant) {
    _plants.add(newPlant);

    // TODO save in Firebase

    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes the plant with the given [id] from the list
  void removePlant(String id) {
    _plants.removeWhere((plant) => plant.id == id);
    notifyListeners();
  }
}