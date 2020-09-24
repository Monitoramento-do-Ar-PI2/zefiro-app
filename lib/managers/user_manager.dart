import 'package:flutter/material.dart';
import 'package:zefiro_app/models/user.dart';

class UserManager extends ChangeNotifier {
  User user;

  UserManager() {
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() {
    print(user.toString());
  }
}
