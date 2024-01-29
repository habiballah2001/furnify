import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../local/cache_helper.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    debugPrint('dioHelper Initialized');
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://$ip:8000/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Connection': 'keep-alive',
      'Authorization': CacheHelper.getData(key: "token") == null
          ? ''
          : 'Token ${CacheHelper.getData(key: "token")}',
      //'Authorization': 'f94ec672d3e8d8a994e873bab46cdb21f5878a5b'
    };
    debugPrint('get query :$query');
    debugPrint('get token :$token');

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': CacheHelper.getData(key: "token") == null
          ? ''
          : 'Token ${CacheHelper.getData(key: "token")}',
    };
    debugPrint('post data : $data');
    debugPrint('post query :' '$query');
    try {
      Response post = await dio.post(url, data: data);
      debugPrint("statuuuuuuuuuuuus cooode ${post.statusCode}");
      if (post.statusCode == 200) {
        debugPrint('poooost  $post');
        return post;
      } else if (post.statusCode == 201) {
        debugPrint('poooost error ${post.data}');
        return post;
      } else if (post.statusCode == 400) {
        debugPrint("errrrrrrrrrooooooor ${post.data}");
        throw Exception();
      }
      // debugPrint('post post post : ${post}');
      return post;
    } catch (err) {
      debugPrint('poooost error${err.toString()}');
      rethrow;
    }
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': CacheHelper.getData(key: "token") == null
          ? ''
          : 'Token ${CacheHelper.getData(key: "token")}',
    };
    debugPrint('put data : $data');
    debugPrint('put query :$query');
    debugPrint('put token :$token');
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': CacheHelper.getData(key: "token") == null
          ? ''
          : 'Token ${CacheHelper.getData(key: "token")}',
    };
    debugPrint('url delete :$url');
    debugPrint('delete token :$token');

    return await dio.delete(url, queryParameters: query, data: data);
  }
}
