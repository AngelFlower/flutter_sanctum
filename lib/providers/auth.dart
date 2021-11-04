import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter_sanctum/utils/dio.dart';

class Auth extends ChangeNotifier {
  bool _isAuth = false;

  bool get isAuth => _isAuth;

  Future login({required Map credentials}) async {
    _isAuth = true;

    Dio.Response response =
        await dio().post('/auth/token', data: json.encode(credentials));

    String token = json.decode(response.toString())['token'];

    log(token);

    notifyListeners();
  }

  void logout() {
    _isAuth = false;
    notifyListeners();
  }
}
