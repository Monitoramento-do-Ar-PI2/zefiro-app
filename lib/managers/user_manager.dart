import 'package:flutter/material.dart';
import 'package:zefiro_app/models/user.dart';

class UserManager extends ChangeNotifier {
  User user;
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  UserManager() {
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    loading = true;
    user = User();
    await user.setAddress();
    loading = false;
  }
}
