class Favorite {
  Favorite({
    this.id,
    required this.favoriteId,
    required this.name,
    required this.price,
  });

  int? id;
  String name;
  int price;
  int favoriteId;

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      name: json['name'],
      price: json['price'],
      favoriteId: json['favoriteId'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'favoriteId': favoriteId,
    };
  }
}
