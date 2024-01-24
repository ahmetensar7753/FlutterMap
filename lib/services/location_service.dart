import 'dart:developer';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationService {
  final Location _location = Location();

  Future<LatLng> getUserLocation() async {
    LocationData currentLocation = await _location.getLocation();
    log('${currentLocation.latitude} - ${currentLocation.longitude}');
    return LatLng(currentLocation.latitude!, currentLocation.longitude!);
  }
}
