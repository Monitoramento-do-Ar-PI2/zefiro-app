import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      await getUserData(user);
    } catch (e) {
      locationError = true;
      debugPrint(e);
    }
    loading = false;
  }

  static Future<bool> userDataExists(Future<SharedPreferences> prefs) {
    final key = 'userDataExists';
    Future<bool> value = prefs.then((SharedPreferences p) {
      return (p.getBool(key) ?? false);
    });
    print('Value found <${value.toString()}>');
    return value;
  }

  static Future<void> saveUserHealthProblems(
      List<String> healthProblems) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'userHealthProblems';
    await prefs.setStringList(key, healthProblems);
  }

  static Future<void> saveUserAge(int age) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'userAge';
    await prefs.setInt(key, age);
  }

  static Future<void> setUserDataFlag(bool f) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'userDataExists';
    await prefs.setBool(key, f);
  }

  Future<void> saveUserData(int age, List<String> healthProblems) async {
    loading = true;
    await Future.delayed(Duration(seconds: 3));
    print('loading $loading');
    print('Savind user data');
    print(age);
    print(healthProblems);
    await setUserDataFlag(true);
    await saveUserAge(age);
    await saveUserHealthProblems(healthProblems);
    loading = false;
    print('loading $loading');
  }

  Future<void> getUserData(User user) async {
    loading = true;
    final prefs = await SharedPreferences.getInstance();
    user.age = prefs.getInt('userAge') ?? null;
    user.healthProblems = prefs.getStringList('userHealthProblems') ?? null;
    print('User age:');
    print(user.age);
    print('User health problems');
    print(user.healthProblems);

    loading = false;
  }

  //todo: implementar carregamento dos dados
}
