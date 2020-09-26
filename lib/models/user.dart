import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class User {
  int age;
  Position position;
  String address;

  User({this.age, this.position, this.address});

  Future<void> setPosition() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    this.position = position;
  }

  Future<void> setAddress() async {
    await setPosition();
    print("Chegou no setAddress");
    print(position.latitude);
    print(position.longitude);
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
