import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_sanctum/providers/auth.dart';

Dio dio() {
  var dio = Dio(
    BaseOptions(
      baseUrl: 'http://127.0.0.1:8000/api/',
      responseType: ResponseType.plain,
      connectTimeout: 5 * 1000, // 60 seconds
      receiveTimeout: 5 * 1000,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      requestInterceptor(options);
      return handler.next(options);
    },
  ));

  return dio;
}

dynamic requestInterceptor(RequestOptions options) async {
  if (options.headers.containsKey('auth')) {
    var token = await Auth().getToken();
    options.headers.addAll({'Authorization': 'Bearer $token'});
  }
}
