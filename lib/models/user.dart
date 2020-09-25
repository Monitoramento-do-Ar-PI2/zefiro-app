import 'package:geolocator/geolocator.dart';

class User {
  int age;
  Position position;
  String localization;

  User({this.age, this.position, this.localization});

  Future<void> getPosition() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    this.position = position;
  }
}
