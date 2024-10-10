// import 'package:dio/dio.dart';

// final dio = Dio();

// void getHttp() async {
//   final response = await dio.get('https://dart.dev');
//   print(response);
// }

import 'package:dio/dio.dart';

final dio = Dio();

void getHttp() async {
  final Response response = await dio.get(
      'https://newsapi.org/v2/everything?q=tesla&from=2024-09-02&sortBy=publishedAt&apiKey=660972e7a0c249b0b2fa51fe054a41dc');
  print(response);
}
