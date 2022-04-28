import 'package:flutter/material.dart';
import 'package:wine/models/wine.dart';
import 'package:wine/pages/cart_page.dart';
import 'package:wine/pages/form_page.dart';
import 'package:wine/pages/wines_card_page.dart';
import 'package:wine/repository/wine.dart';
import 'package:wine/widgets/logo.dart';
import 'package:wine/widgets/wine_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final wineRepository = WineRepository();
  late Future<List<Wine>> winesFuture = wineRepository.getWines();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const LogoWidget(),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            color: const Color.fromARGB(255, 45, 40, 122),
            onPressed: () async {
              bool value = await Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const FormWinePage()),
              );

              if (value == true) {
                setState(() {
                  winesFuture = wineRepository.getWines();
                });
              }
            },
          ),
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
      body: FutureBuilder<List<Wine>>(
        future: winesFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Wine not found, because there was error.'),
            );
          } else if (snapshot.hasData) {
            final list = snapshot.data!;
            if (list.isEmpty) {
              return const Center(
                child: Text('Your list is empty.'),
              );
            } else {
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final wine = list[index];
                  return WineCard(
                    wine: wine.name,
                    price: wine.price,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: Colors.white, width: 1, style: BorderStyle.solid),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_rounded),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => WinescardPage(
                                name: wine.name,
                                temperature: wine.temperature.toInt(),
                                grape: wine.grapes,
                                pairings: wine.pairings,
                                price: wine.price,
                                id: wine.id!.toInt(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
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
