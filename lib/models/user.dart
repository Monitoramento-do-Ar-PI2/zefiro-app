import 'package:geolocator/geolocator.dart';

class User {
  User({this.age, this.position, this.localization});

  int age;
  Position position;
  String localization;

  Future<void> getPosition() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    this.position = position;
  }
}
