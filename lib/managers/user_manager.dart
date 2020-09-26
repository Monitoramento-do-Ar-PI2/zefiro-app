import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zefiro_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zefiro_app/services/cep_aberto_service.dart';

class UserManager extends ChangeNotifier {
  User user;
  bool _loading = false;
  bool localizationError = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  UserManager() {
    _loadLocalData();
  }

  Future<void> _loadLocalData() async {
    loading = true;
    final cepAbertoService = CepAbertoService();
    final sharedPreferences = await _sharedPreferences;
    user = User();

    if (sharedPreferences.getString('position') == null) {
      await user.getPosition();
      sharedPreferences.setString('position', jsonEncode(user.position));
    }

    final localStoragePosition = sharedPreferences.get('position');
    final positionJson = jsonDecode(localStoragePosition);
    final lat = positionJson['latitude'];
    final long = positionJson['longitude'];
    print(lat);
    print(long);

    user.localization = await cepAbertoService
        .getLocalizationFromLatLong(lat, long)
        .catchError((error, stackTrace) {
      localizationError = true;
    });

    loading = false;
  }
}
