import 'package:dio/dio.dart';
import 'package:wine/models/wine.dart';

class WineRepository {
  final dio = Dio()..options.baseUrl = 'http://localhost:3000/';

  Future<List<Wine>> getWine() async {
    final reponse = await dio.get('wine');
    final list = reponse.data as List;
    final mappedList = list.map((object) => Wine.fromJson(object)).toList();

    return mappedList;
  }
}
