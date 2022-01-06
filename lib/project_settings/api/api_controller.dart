import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_search_app/project_settings/api/routes/api_routes.dart';
import 'package:provider/src/provider.dart';
import '../../data/model/data/url_list_model.dart';
import 'base_url.dart';
import 'dart:io';

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
  Future<String?> searchByUrlGoogle(String url) async {
    String? responseData;
    try{
      await dio.get(
          BaseUrl.google+ApiRoutes.searchByImageGoogle+url,
      ).then((response) => responseData=response.realUri.toString());
    } on DioError catch (error) {
      debugPrint("Error message: " + error.response!.data['message']);
      debugPrint("Error code: " + error.message);
    }
    return responseData;
  }
  Future<String?> searchByUrlYandex(String url) async {
    String? responseData;
    try{
      await dio.get(
          BaseUrl.yandex+ApiRoutes.searchByImageYandex+url,
      ).then((response) => responseData=response.realUri.toString());
    } on DioError catch (error) {
      debugPrint("Error message: " + error.response!.data['message']);
      debugPrint("Error code: " + error.message);
    }
    return responseData;
  }
  Future<String?> searchByImage(String url) async {
    String? responseData;
    try{
      await dio.get(
        BaseUrl.google+ApiRoutes.searchByImageGoogle+url,
      ).then((response) => responseData=response.realUri.toString());
    } on DioError catch (error) {
      debugPrint("Error message: " + error.response!.data['message']);
      debugPrint("Error code: " + error.message);
    }
    return responseData;
  }
  Future<void> uploadImage(File file,BuildContext context) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file":
      await MultipartFile.fromFile(file.path, filename:fileName),
      "timestamp": DateTime.now().toString(),
      "api_key":'891219667978811',
      "upload_preset":'kuktu5xn'});
    await dio.post(BaseUrl.server, data: formData).then((response) => context.read<UrlList>().addList(response.data['url'].toString()));
  }
}