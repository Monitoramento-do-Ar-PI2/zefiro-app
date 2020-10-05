import 'package:zefiro_app/models/station.dart';

class AirPollutant {
  Map<String, dynamic> iqa;
  Station station;
  Map<String, dynamic> currentPollutant;

  AirPollutant({this.iqa, this.station, this.currentPollutant});
}
