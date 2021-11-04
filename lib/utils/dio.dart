import 'package:dio/dio.dart';

Dio dio() {
  var dio = Dio(
    BaseOptions(
      baseUrl: 'http://127.0.0.1:8000/api/',
      responseType: ResponseType.plain,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );
  return dio;
}
