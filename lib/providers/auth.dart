import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter_sanctum/models/user.dart';
import 'package:flutter_sanctum/utils/dio.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Auth extends ChangeNotifier {
  final storage = FlutterSecureStorage();

  bool _isAuth = false;
  late User _user;

  bool get isAuth => _isAuth;
  User get user => _user;

  Future login({required Map credentials}) async {
    String deviceID = await getDeviceID();

    Dio.Response response = await dio().post('/auth/token',
        data: json.encode(credentials..addAll({'deviceID': deviceID})));

    String token = json.decode(response.toString())['token'];

    await attempt(token);

    storeToke(token);
  }

  Future attempt(String token) async {
    try {
      Dio.Response response = await dio().get(
        'auth/user',
        options: Dio.Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      _user = User.fromJson(json.decode(response.toString()));
      _isAuth = true;
    } catch (e) {
      _isAuth = false;
    }

    notifyListeners();
  }

  storeToke(String token) async {
    await storage.write(key: 'auth', value: token);
  }

  Future getDeviceID() async {
    String? deviceID;
    try {
      deviceID = await PlatformDeviceId.getDeviceId;
      print('Device ID: $deviceID');
    } catch (e) {}

    return deviceID;
  }

  void logout() {
    _isAuth = false;
    notifyListeners();
  }
}
