import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://autismx.net/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    @required String url,
    @required Map<String, dynamic> data,
  }) async {
    return dio.post(
      url,
      data: data,
    );
  }
}
