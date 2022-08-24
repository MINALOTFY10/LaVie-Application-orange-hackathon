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

  // static Future<Response> getData({
  //   required String url,
  //   required String token,
  //   option: option(
  //     'Authorization': "bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzVlNWIwZC0wZDE5LTRmZTUtYjEwZi01M2ViNDEyMDdiMjIiLCJpYXQiOjE2NjEwNzE0OTEsImV4cCI6MTY2MTI0NDI5MX0.6zYCfdLwpb4LcOtYklvod_m9hz6W_UfuQsl_poDkmo0",
  //   )
  // }) async
  // {
  //   dio.options.headers =
  //   {
  //     'Accept': "bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzVlNWIwZC0wZDE5LTRmZTUtYjEwZi01M2ViNDEyMDdiMjIiLCJpYXQiOjE2NjEwNzE0OTEsImV4cCI6MTY2MTI0NDI5MX0.6zYCfdLwpb4LcOtYklvod_m9hz6W_UfuQsl_poDkmo0",
  //   };
  //
  //   return await dio.get(
  //     url,
  //
  //   );
  // }
  static Future<Response> getData(
      {required String url, required Map<String, dynamic> query}) async {

    return await dio.get(
        url,
        queryParameters: query,
        options: Options(
            headers: {
              "Content-Type": "application/json",
              "authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzVlNWIwZC0wZDE5LTRmZTUtYjEwZi01M2ViNDEyMDdiMjIiLCJpYXQiOjE2NjEyNTUyNDEsImV4cCI6MTY2MTQyODA0MX0.wG7SKKyplZmqdLfpnswmNey9Dmf4LBDLhu49cyFmoB4",
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

  // static Future<Response> putData({
  //   @required String url,
  //   @required Map<String, dynamic> data,
  //   Map<String, dynamic> query,
  //   String lang = 'en',
  //   String token,
  // }) async
  // {
  //   dio.options.headers =
  //   {
  //     'lang':lang,
  //     'Authorization': token??'',
  //     'Content-Type': 'application/json',
  //   };
  //
  //   return dio.put(
  //     url,
  //     queryParameters: query,
  //     data: data,
  //   );
  // }

}
