import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zefiro_app/models/air_pollutant.dart';
import 'package:zefiro_app/models/station.dart';

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

  Dio dio = Dio();

  Future<void> requestCurrentIQA() async {
    loading = true;
    airPollutant = AirPollutant();
    //requestNearestStation();
    //Fake api endpoint
    Map<String, dynamic> iqa;
    await dio
        .get('https://run.mocky.io/v3/184761de-adfe-415e-9797-72aca2061d7e')
        .then((response) {
      print("Response $response");
      // iqa.add(response.data['airpollutant']['iqa']);
      // iqa.add(response.data['airpollutant']['iqa_label']);
      
      var iqa_response = Map<String, dynamic>.from(response.data);

      final iqa = iqa_response['airpollutant'];
      
      this.airPollutant.iqa = iqa;
      loading = false;      
      
    });
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
