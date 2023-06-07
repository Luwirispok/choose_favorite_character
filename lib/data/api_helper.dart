import 'package:choose_favorite_character/di/injection.dart';
import 'package:dio/dio.dart';

class ApiRequest {
  static Future<dynamic> getApiHelper(String path) async {
    try {
      final Dio dio = Locator.injection<Dio>();
      Response<dynamic> response = await dio.get(path);
      if (response.statusCode.toString().startsWith('2')) {
        return response.data;
      } else {
        throw Exception('Проблема на сервере: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Упс... ${e.toString()}');
    }
  }
}
