import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:zefiro_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zefiro_app/services/cep_aberto_service.dart';

class UserManager extends ChangeNotifier {
  User user;
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  UserManager() {
    print("UserManager Instanciado");
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    loading = true;
    final cepAbertoService = CepAbertoService();
    final userData = await _sharedPreferences;
    if (userData.getString('position') == null) {
      user = User();
      await user.getPosition();

      final lat = user.position.latitude;
      final long = user.position.longitude;
      user.localization =
          await cepAbertoService.getLocalizationFromLatLong(lat, long);
    }
    loading = false;
  }
}
