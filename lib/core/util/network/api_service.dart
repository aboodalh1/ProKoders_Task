import 'package:dio/dio.dart';

class DioHelper {
  final baseUrl = 'https://dummyjson.com/';
  final Dio dio;

  DioHelper(this.dio);

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
    String lang = "en",
  }) async {
    Map<String, String> headers = {'Accept': 'application/json'};

    return await dio.get(
      '$baseUrl$endPoint',
      queryParameters: query,
      options: Options(
        contentType: 'application/json',
        validateStatus: (v) => v != null && v >= 200 && v <= 430,
        receiveDataWhenStatusError: true,
        headers: headers,
      ),
    );
  }

  Future<Response> postData({
    required String endPoint,
    required var data,
  }) async {
    Map<String, String> headers = {'Accept': 'application/json'};
    return dio.post(
      '$baseUrl$endPoint',
      data: data,
      options: Options(receiveDataWhenStatusError: true, headers: headers),
    );
  }
}
