import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_search_app/project_settings/api/routes/api_routes.dart';

import 'base_url.dart';

class Api{
  final  Dio dio = Dio();
  Future<String?> searchByWordsGoogle(String query) async {
    String? responseData;
    try{
      await dio.get(
          BaseUrl.google+ApiRoutes.searchByWordsGoogle,
          queryParameters: {
            'q':query
          }
      ).then((response) => responseData=response.realUri.toString());
    } on DioError catch (error) {
      debugPrint("Error message: " + error.response!.data['message']);
      debugPrint("Error code: " + error.message);
    }
    return responseData;
  }
  Future<String?> searchByWordsYandex(String query) async {
    String? responseData;
    try{
      await dio.get(
          BaseUrl.yandex+ApiRoutes.searchByWordsYandex,
          queryParameters: {
            'text':query
          }
      ).then((response) => responseData=response.realUri.toString());
    } on DioError catch (error) {
      debugPrint("Error message: " + error.response!.data['message']);
      debugPrint("Error code: " + error.message);
    }
    return responseData;
  }
}