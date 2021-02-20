class Plant {
  String id;
  double height;
  double waterLevel;
  DateTime createdAt;

  Plant({
    double height,
    double waterLevel,
  }) :
  this.height = height == null ? 0 : height,
  this.waterLevel = waterLevel == null ? 0 : waterLevel,
  this.createdAt = DateTime.now(),
  this.id = "random id from firebase";

  void feed(double foodCount) {
    this.height += 10;
  }

  void water(double waterAmount) {
    this.waterLevel += 10;
  }
}
