import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zefiro_app/models/air_pollutant.dart';

class AirPollutantManager extends ChangeNotifier {
  AirPollutantManager() {
    airPollutant = AirPollutant();
    requestCurrentIQA();
    requestCurrentPollutants();
  }

  AirPollutant airPollutant;
  String _selectedPollutant;
  String get selectedPollutant => _selectedPollutant;
  set selectedPollutant(String value) {
    _selectedPollutant = value;
    notifyListeners();
  }

  double _selectedPollutantValue;
  double get selectedPollutantValue => _selectedPollutantValue;
  set selectedPollutantValue(double value) {
    _selectedPollutantValue = value;
    notifyListeners();
  }

  bool _iqaLoading = false;
  bool get iqaLoading => _iqaLoading;
  set iqaLoading(bool value) {
    _iqaLoading = value;
    notifyListeners();
  }

  bool _currentPollutantsLoading = false;
  bool get currentPollutantsLoading => _currentPollutantsLoading;
  set currentPollutantsLoading(bool value) {
    _currentPollutantsLoading = value;
    notifyListeners();
  }

  Dio dio = Dio();

  Future<void> requestCurrentIQA() async {
    iqaLoading = true;
    //requestNearestStation();
    //Fake api endpoint
    await dio
        .get('https://run.mocky.io/v3/184761de-adfe-415e-9797-72aca2061d7e')
        .then((response) {
      print("Response $response");

      var iqaResponse = Map<String, dynamic>.from(response.data);

      final iqa = iqaResponse['airpollutant'];

      this.airPollutant.iqa = iqa;
      iqaLoading = false;
    });
  }

  Future<void> requestCurrentPollutants() async {
    currentPollutantsLoading = true;
    Random random = Random();
    var rng = random.nextInt(2);
    if (rng == 1) {
      await dio
          .get('https://run.mocky.io/v3/c4ea4ff5-b711-4b35-a0f5-1d0d70e4ff71')
          .then((response) {
        print("Response $response");
        var currentPollutantResponse = Map<String, dynamic>.from(response.data);
        this.airPollutant.currentPollutant = currentPollutantResponse;
        currentPollutantsLoading = false;
      });
    } else {
      await dio
          .get('https://run.mocky.io/v3/c9512046-052a-44bc-b102-c946d95ea5b3')
          .then((response) {
        print("Response $response");
        var currentPollutantResponse = Map<String, dynamic>.from(response.data);
        this.airPollutant.currentPollutant = currentPollutantResponse;
        currentPollutantsLoading = false;
      });
    }
  }

  /*Future<void> requestNearestStation(Position userPosition) async {
    await dio.get("API_URL").then((response) {
      airPollutant.station = Station();
      airPollutant.station.name = response.data['name'];
      airPollutant.station.latitude = response.data['latitude'];
      airPollutant.station.longitude = response.data['longitude'];
    });
  }*/

  //TODO Implemetar requisições quando os respectivos serviços da api estiverem prontos
}
