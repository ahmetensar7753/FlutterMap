import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_app/services/location_service.dart';

class MapService {
  final LocationService _locationService;

  MapService(this._locationService);

  Future<Set<Marker>> getMarkers() async {
    Set<Marker> markers = <Marker>{};

    markers.add(
      Marker(
        markerId: const MarkerId('user_location'),
        position: await _locationService.getUserLocation(),
        infoWindow: const InfoWindow(
          title: 'Your Location',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );

    return markers;
  }

  Set<Polygon> getPolygons() {
    List<LatLng> polygonPoints = [
      /* const LatLng(37.7749, -122.4194),
      const LatLng(37.7749, -122.5294),
      const LatLng(37.6749, -122.5294),
      const LatLng(37.6749, -122.4194), */
    ];

    return {
      Polygon(
        polygonId: const PolygonId('sample_polygon'),
        points: polygonPoints,
        strokeWidth: 2,
        strokeColor: Colors.blue,
        fillColor: Colors.blue.withOpacity(0.3),
      ),
    };
  }
}
