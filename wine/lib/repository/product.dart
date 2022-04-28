import 'package:dio/dio.dart';
import 'package:wine/models/product.dart';

class ProductRepository {
  final dio = Dio()..options.baseUrl = 'http://localhost:3000/';
  Future<List<Product>> getProducts() async {
    final reponse = await dio.get('cart');
    final list = reponse.data as List;
    final mappedList = list.map((object) => Product.fromJson(object)).toList();

    return mappedList;
  }

  Future<void> postProduct(Product product) async {
    await dio.post(
      'cart',
      data: product.toJson(),
    );
  }

  Future<void> removeProducts(int id) async {
    await dio.delete('cart/$id');
  }
}
