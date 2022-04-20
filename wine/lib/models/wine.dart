class Wine {
  Wine({
    required this.name,
    required this.temperature,
    required this.grapes,
    required this.pairings,
    required this.price,
    required this.qtde,
  });

  final String name;
  final String grapes;
  final String pairings;
  final double temperature;
  final int price;
  final double qtde;

  factory Wine.fromJson(Map<String, dynamic> json) {
    return Wine(
      name: json['name'],
      grapes: json['grapes'],
      pairings: json['pairings'],
      temperature: json['temperature'],
      price: json['price'],
      qtde: json['qtde'],
    );
  }
}
