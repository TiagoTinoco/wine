import 'package:flutter/material.dart';
import 'package:wine/models/wine.dart';
import 'package:wine/pages/wines_card_page.dart';
import 'package:wine/repository/wine.dart';
import 'package:wine/widgets/wine_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final wineRepository = WineRepository();
  late final winesFuture = wineRepository.getWine();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: RichText(
          text: TextSpan(
            text: 'Wi',
            style: TextStyle(
              fontSize: 50,
              color: Colors.pink[200],
              fontWeight: FontWeight.bold,
              fontFamily: 'PlayfairDisplay',
            ),
            children: const <TextSpan>[
              TextSpan(
                text: ' ne.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Color.fromARGB(255, 45, 40, 122),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            color: const Color.fromARGB(255, 45, 40, 122),
            onPressed: () {},
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
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const WinescardPage(),
                        ),
                      );
                    },
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
