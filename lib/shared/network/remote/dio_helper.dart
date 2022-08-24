import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static late Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://lavie.orangedigitalcenteregypt.com',
        receiveDataWhenStatusError: true,
      ),

    );
  }

  static Future<Response> getData(
      {required String url, required Map<String, dynamic> query}) async {

    return await dio.get(
        url,
        queryParameters: query,
        options: Options(
            headers: {
              "Content-Type": "application/json",
              "authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI0NmMzMGU3Ni00MWI3LTRhMWQtODliOS1kNTcwOTE1Y2YwYzMiLCJpYXQiOjE2NjEzNjU4NzksImV4cCI6MTY2MTUzODY3OX0.jQCE99_nMdLe8j0Cdt_uC50t3lv_wIHKj9_h80a7TDc",
            }
        ));
  }

  static Future<Response> getDataByTitle(
      {required String url, required Map<String, dynamic> query}) async {

    return await dio.get(
        url,
        queryParameters: query,
        options: Options(
            headers: {
              "Content-Type": "application/json",
              "authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI0NmMzMGU3Ni00MWI3LTRhMWQtODliOS1kNTcwOTE1Y2YwYzMiLCJpYXQiOjE2NjEzNjU4NzksImV4cCI6MTY2MTUzODY3OX0.jQCE99_nMdLe8j0Cdt_uC50t3lv_wIHKj9_h80a7TDc",
            }
        ));
  }


  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    dynamic token,
  }) async
  {
    dio.options.headers =
    {
      'Authorization': token??'',
      'Content-Type': 'application/json',
    };

    return dio.post(
      url,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    dynamic token,
  }) async
  {
    dio.options.headers =
    {
      "authorization":"Bearer ${token}",
      'Content-Type': 'application/json',
    };

    return dio.post(
      url,
      data: data,
    );
  }

}
