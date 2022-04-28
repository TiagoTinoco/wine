class Wine {
  Wine({
    this.id,
    required this.name,
    required this.temperature,
    required this.grapes,
    required this.pairings,
    required this.price,
  });

  int? id;
  String name;
  String grapes;
  String pairings;
  double temperature;
  int price;

  factory Wine.fromJson(Map<String, dynamic> json) {
    return Wine(
      name: json['name'],
      grapes: json['grapes'],
      pairings: json['pairings'],
      temperature: json['temperature'],
      price: json['price'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'grapes': grapes,
      'pairings': pairings,
      'temperature': temperature,
      'price': price,
    };
  }
}
