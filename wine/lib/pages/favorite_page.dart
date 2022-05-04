import 'package:flutter/material.dart';
import 'package:wine/repository/favorite.dart';
import 'package:wine/widgets/logo.dart';

import '../models/favorite.dart';
import '../widgets/wine_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => FavoritePageState();
}

class FavoritePageState extends State<FavoritePage> {
  final favoriteRepository = FavoriteRepository();
  late Future<List<Favorite>> favoriteFuture = favoriteRepository.getFavorites();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const LogoWidget(title: 'Favorited'),
      ),
      body: FutureBuilder<List<Favorite>>(
        future: favoriteFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Favorited not found, because there was error.'),
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
                  final favorite = list[index];
                  return WineCard(
                    wine: favorite.name,
                    price: favorite.price,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: Colors.white, width: 1, style: BorderStyle.solid),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.delete_outlined),
                        color: Colors.white,
                        iconSize: 20,
                        onPressed: () async {
                          await favoriteRepository.removeFavorites(favorite.id!);
                          setState(() {
                            favoriteFuture = favoriteRepository.getFavorites();
                          });
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
