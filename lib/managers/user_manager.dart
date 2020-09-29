import 'package:flutter/material.dart';
import 'package:zefiro_app/models/user.dart';

class UserManager extends ChangeNotifier {
  User user;
  bool _loading = false;
  bool _locationError = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool get locationError => _locationError;

  set locationError(bool value) {
    _locationError = value;
    notifyListeners();
  }

  UserManager() {
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    loading = true;
    user = User();
    try {
      await user.setAddress();
    } catch (e) {
      locationError = true;
      debugPrint(e);
    }

    loading = false;
  }
}
