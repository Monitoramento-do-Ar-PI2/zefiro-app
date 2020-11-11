import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class User {
  int age;
  Position position;
  String address;
  List<String> healthProblems;

  User({this.age, this.position, this.address, this.healthProblems});

  Future<void> setPosition() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    this.position = position;
  }

  Future<void> setAddress() async {
    await setPosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    final place = placemarks[0];
    final sublocality = place.subLocality;
    final administrativeArea = place.administrativeArea;
    String address;
    if (sublocality.isEmpty)
      address = '$administrativeArea';
    else
      address = '$sublocality, $administrativeArea';
    this.address = address;
  }
}
