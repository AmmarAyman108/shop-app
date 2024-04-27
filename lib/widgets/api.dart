import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  Future get(
      {required String url,
      String? token,
      Map<String, dynamic>? queryParameters}) async {
    Dio dio = Dio();
    Map<String, dynamic> headers = {
      //  'Content-Type': 'application/x-www-form-urlencoded',
      // 'Accept': 'application/json',
    };
    if (token != null) {
      headers.addAll(
        {
          'Authorization': 'Bearer $token',
        },
      );
    }

    try {
      Response response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  //DELETE Method
  Future delete({
    required String url, //url is contain id of item to delete
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    Dio dio = Dio();
    Map<String, dynamic> headers = {};
    if (token != null) {
      headers.addAll(
        {
          'Authorization': 'Bearer $token',
        },
      );
    }

    try {
      Response response = await dio.delete(url,
          queryParameters: queryParameters, options: Options(headers: headers));
      return response.data;
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

//POST Method

  Future post({
    required String url,
    required body,
    String? token,
  }) async {
    Dio dio = Dio();
    Map<String, String> headers = {
      // 'Content-Type': 'application/x-www-form-urlencoded',
      // 'Accept': 'application/json',
    };
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    try {
      Response response = await dio.post(
        url,
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      print(response.data);
      return response.data;
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

//PUT Method

  Future put({
    required String url,
    required body,
    @required String? token,
  }) async {
    Dio dio = Dio();
    print('url:$url\n body:$body\ntoken:$token');
    Map<String, String> headers = {
      // 'Content-Type': 'application/x-www-form-urlencoded',
      // 'Accept': 'application/json',
    };
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    try {
      Response response = await dio.put(
        url,
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      print(response.data);
      return response.data;
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
