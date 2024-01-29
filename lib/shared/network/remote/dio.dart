// import 'package:Furnify/shared/constants.dart';
// import 'package:dio/dio.dart';
//
// class DioHelper2 {
//   static Dio? _dio;
//
//   static init() {
//     _dio = Dio(BaseOptions(
//       baseUrl: "http://$ip:8000",
//       receiveDataWhenStatusError: true,
//     ));
//   }
//
//   static Future<Response> getData(
//       {required String url, Map<String, dynamic>? query, String? Token}) {
//     _dio!.options.headers = {
//       "Content-Type": "application/json",
//       "Accept": "*/*",
//       "Authorization": Token
//     };
//     return _dio!.get(url, queryParameters: query);
//   }
//
//   static Future<Response> postData(
//       {required String url,
//       required Map<String, dynamic> data,
//       Map<String, dynamic>? query,
//       String? Token}) {
//     print("asdasdasdasdasd");
//     _dio!.options.headers = {
//       "Content-Type": "application/json",
//       "Accept": "*/*",
//       "Authorization": Token
//     };
//     return _dio!.post("/accounts/registration/", queryParameters: query, data:
//     {
//       "username": "pseer",
//       "email": "peessslr@example.com",
//       "first_name": "Pseter",
//       "last_name": "Jonses",
//       "password": "mypassword",
//       "password2": "mypsassword",
//       "phone": "555-666s6",
//       "address": "666 Oak St",
//       "city": "2"
//     }).then((value){
//       print(value.data);
//       return Future.value(value);
//     });
//   }
//
//   static Future<Response> deleteData(
//       {required String url,
//       Map<String, dynamic>? data,
//       Map<String, dynamic>? query,
//       String? Token}) {
//     _dio!.options.headers = {
//       "Content-Type": "application/json",
//       "Accept": "*/*",
//       "Authorization": Token
//     };
//     return _dio!.delete(url, queryParameters: query, data: data);
//   }
// }
