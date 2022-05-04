import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wine/models/favorite.dart';
import 'package:wine/models/product.dart';
import 'package:wine/pages/cart_page.dart';
import 'package:wine/repository/favorite.dart';
import 'package:wine/repository/product.dart';
import 'package:wine/widgets/button.dart';
import 'package:wine/widgets/logo.dart';

import '../store/card.store.dart';

class WinescardPage extends StatefulWidget {
  const WinescardPage({
    Key? key,
    required this.name,
    required this.grape,
    required this.pairings,
    required this.price,
    required this.temperature,
    required this.id,
  }) : super(key: key);

  final String name;
  final String grape;
  final String pairings;
  final int temperature;
  final int price;
  final int id;

  @override
  State<WinescardPage> createState() => _WinescardPageState();
}

class _WinescardPageState extends State<WinescardPage> {
  final productRepository = ProductRepository();
  final favoriteRepository = FavoriteRepository();
  final store = CardStore();
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    favoriteRepository.getFavorite(widget.id).then((value) {
      if (value == true) {
        isFavorite = true;
      } else {
        isFavorite = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.pink),
        elevation: 2,
        title: const LogoWidget(
          title: 'Card',
        ),
        actions: [
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            color: const Color.fromARGB(255, 45, 40, 122),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CartPage(),
                ),
              );
            },
          ),
          const SizedBox(width: 20),
          CircleAvatar(backgroundColor: Colors.pink[200]),
          const SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 50, left: 50, top: 40, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.pink[200],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text(
                'Bordeaux',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Text(
              'Pauillac red',
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 45, 40, 122),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Service(
              title: 'Service temperature',
              subtitle: widget.temperature.toString() + '°',
            ),
            Service(
              title: 'Grapes',
              subtitle: widget.grape,
            ),
            Service(
              title: 'Food pairings',
              subtitle: widget.pairings,
            ),
            const SizedBox(height: 30),
            Text(
              '\$ ${widget.price}',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Observer(
              builder: (context) => Row(
                children: [
                  CountButton(
                    store: store,
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey[50],
                    ),
                    child: Material(
                      color: Colors.blueGrey[50],
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                            if (isFavorite == true) {
                              favoriteRepository.postFavorite(
                                Favorite(
                                  favoriteId: widget.id,
                                  name: widget.name,
                                  price: widget.price,
                                ),
                              );
                            } else {
                              favoriteRepository.removeFavorites(widget.id);
                            }
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 20,
                          color: isFavorite ? Colors.pink : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ButtonWidget(
              title: 'Add to cart',
              onPressed: () {
                productRepository.postProduct(
                  Product(
                    name: widget.name,
                    price: widget.price,
                    quantity: store.quantity,
                    wineId: widget.id,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Service extends StatelessWidget {
  const Service({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 210,
          child: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class CountButton extends StatelessWidget {
  const CountButton({
    Key? key,
    required this.store,
  }) : super(key: key);

  final CardStore store;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blueGrey[50],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: Colors.blueGrey[50],
            child: IconButton(
              onPressed: () {
                if (store.quantity > 1) {
                  store.decrementQuantity();
                }
              },
              icon: const Icon(Icons.remove, size: 13),
            ),
          ),
          Observer(
            builder: (_) => Text(
              store.quantity.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Material(
            color: Colors.blueGrey[50],
            child: IconButton(
              onPressed: () {
                store.incrementQuantity();
              },
              icon: const Icon(Icons.add, size: 15),
            ),
          ),
        ],
      ),
    );
  }
}
