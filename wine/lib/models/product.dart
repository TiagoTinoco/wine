class Product {
  Product({
    this.id,
    required this.quantity,
    required this.wineId,
    required this.name,
    required this.price,
  });

  int? id;
  String name;
  int price;
  int wineId;
  int quantity;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      wineId: json['wineId'],
      quantity: json['quantity'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'wineId': wineId,
      'quantity': quantity,
    };
  }
}
