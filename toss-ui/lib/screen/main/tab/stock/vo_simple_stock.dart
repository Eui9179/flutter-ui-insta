class SimpleStock {
  final String name;

  SimpleStock(this.name);

  factory SimpleStock.of(dynamic json) {
    return SimpleStock(json["name"]);
  }
}