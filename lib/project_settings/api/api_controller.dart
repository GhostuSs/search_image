import 'package:dio/dio.dart';
import 'package:image_search_app/project_settings/api/routes/api_routes.dart';

import 'base_url.dart';

class Api{
  final  Dio dio = Dio();
  Future<void> searchByWordsGoogle(String query) async {
    try{
      await dio.get(
          BaseUrl.google+ApiRoutes.searchByWordsGoogle,
          queryParameters: {
            'q':query
          }
      ).then((response) => print(response.statusCode));
    } on DioError catch (error) {
      print("Error message: " + error.response!.data['message']);
      print("Error code: " + error.message);
    }
  }
  Future<void> searchByWordsYandex(String query) async {
    try{
      await dio.get(
          BaseUrl.yandex+ApiRoutes.searchByWordsYandex,
          queryParameters: {
            'text':query
          }
      ).then((response) => print(response.statusCode));
    } on DioError catch (error) {
      print("Error message: " + error.response!.data['message']);
      print("Error code: " + error.message);
    }
  }
}