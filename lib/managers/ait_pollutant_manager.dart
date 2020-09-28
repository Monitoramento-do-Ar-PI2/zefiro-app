import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zefiro_app/models/air_pollutant.dart';
import 'dart:math';

class AirPollutantManager extends ChangeNotifier {
  AirPollutantManager() {
    airPollutant = AirPollutant();
    requestCurrentIQA();
  }

  AirPollutant airPollutant;
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> requestCurrentIQA() async {
    loading = true;
    airPollutant = AirPollutant();
    Random random = Random();
    double iqa;
    int n = random.nextInt(2);
    print(n);
    Dio dio = Dio();
    if (n == 0) {
      await dio
          .get('https://run.mocky.io/v3/38470183-bf24-4ad2-9238-95f4d3880927')
          .then((response) {
        print("Response $response");
        iqa = response.data['airpollutant']['iqa'];
      });
    } else {
      await dio
          .get('https://run.mocky.io/v3/6ae5e54c-2e37-4048-860a-afed26e6aa39')
          .then((response) {
        print("Response $response");
        iqa = response.data['airpollutant']['iqa'];
      });
    }
    print("IQA : $iqa");
    this.airPollutant.iqa = iqa;
    loading = false;
  }
}
