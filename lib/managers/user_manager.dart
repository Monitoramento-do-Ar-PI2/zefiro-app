import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:zefiro_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserManager extends ChangeNotifier {
  User user;
  Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  UserManager() {
    print("UserManager Instanciado");
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    final userData = await _sharedPreferences;
    if (userData.getString('position') == null) {
      user = User();
      await user.getPosition();
    }
    notifyListeners();
  }
}
