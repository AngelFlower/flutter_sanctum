import 'package:flutter/material.dart';

class Auth extends ChangeNotifier {
  bool _isAuth = false;

  bool get isAuth => _isAuth;

  void login({required Map credentials}) {
    _isAuth = true;
    notifyListeners();
  }

  void logout() {
    _isAuth = false;
    notifyListeners();
  }
}
