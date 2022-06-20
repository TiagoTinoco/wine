import 'package:dio/dio.dart';
import '../models/favorite.dart';

class FavoriteRepository {
  final dio = Dio()..options.baseUrl = 'http://localhost:3000/';
  Future<List<Favorite>> getFavorites() async {
    final reponse = await dio.get('favorite');
    final list = reponse.data as List;
    final mappedList = list.map((object) => Favorite.fromJson(object)).toList();

    return mappedList;
  }

  Future<bool> getFavorite(int id) async {
    try {
      await dio.get('favorite/$id');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> postFavorite(Favorite favorite) async {
    await dio.post(
      'favorite',
      data: favorite.toJson(),
    );
  }

  Future<void> removeFavorites(int id) async {
    await dio.delete('favorite/$id');
  }
}
