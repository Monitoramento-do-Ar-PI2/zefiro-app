import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zefiro_app/models/recomendations.dart';

class RecomendationsManager extends ChangeNotifier {
  static Recomendations rec1 = Recomendations(
      dateTime: DateTime(2020, 11, 12),
      text: 'Use máscara para se protejer da poeira');
  static Recomendations rec2 = Recomendations(
      dateTime: DateTime(2020, 11, 11),
      text: 'Hoje o ar está muito poluido, evite lugares quentes');
  static Recomendations rec3 = Recomendations(
      dateTime: DateTime(2020, 11, 10),
      text: 'A umidade do ar está baixa, procure usar um umidificador');
  final List<Recomendations> allRecomendations = [rec1, rec2, rec3];

  Dio dio = Dio();

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> requestRecomendations() async {
    loading = true;
    await dio
        .get('https://run.mocky.io/v3/fba9f840-4ff0-481e-8753-573636c33c24')
        .then((response) {
      print("Response recomendations $response");
      //Map<String, dynamic> responseMap = Map<String, dynamic>.from(response);
      //allRecomendations.add(response);
      loading = false;
    });
  }
}
