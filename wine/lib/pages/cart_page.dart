import 'package:flutter/material.dart';
import 'package:wine/models/product.dart';
import 'package:wine/widgets/logo.dart';

import '../repository/product.dart';
import '../widgets/wine_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final productRepository = ProductRepository();
  late Future<List<Product>> productFuture = productRepository.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.pink),
        elevation: 2,
        title: const LogoWidget(title: 'Cart'),
      ),
      body: FutureBuilder<List<Product>>(
        future: productFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Product not found, because there was error.'),
            );
          } else if (snapshot.hasData) {
            final list = snapshot.data!;
            if (list.isEmpty) {
              return const Center(
                child: Text('Your product list is empty.'),
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final product = list[index];
                        return WineCard(
                          wine: product.name,
                          price: product.price,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '${product.quantity}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      await productRepository.removeProducts(product.id!);
                                      setState(() {
                                        productFuture = productRepository.getProducts();
                                      });
                                    },
                                    icon: const Icon(Icons.delete_outline_rounded, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      "Buy",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 50,
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 45, 40, 122)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    onPressed: () {
                      list.forEach((product) {
                        productRepository.removeProducts(product.id!);
                      });

                      setState(() {
                        productFuture = productRepository.getProducts();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
