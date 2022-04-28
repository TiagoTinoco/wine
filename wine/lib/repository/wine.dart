import 'package:dio/dio.dart';
import 'package:wine/models/wine.dart';

class WineRepository {
  final dio = Dio()..options.baseUrl = 'http://localhost:3000/';

  Future<List<Wine>> getWines() async {
    final reponse = await dio.get('wine');
    final list = reponse.data as List;
    final mappedList = list.map((object) => Wine.fromJson(object)).toList();

    return mappedList;
  }

  Future<Wine> getWine(int id) async {
    final response = await dio.get('wine/$id');
    return Wine.fromJson(response.data);
  }

  Future<void> postWine(Wine wine) async {
    await dio.post(
      'wine',
      data: wine.toJson(),
    );
  }
}
