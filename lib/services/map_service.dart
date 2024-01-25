import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_app/model.dart/station_model.dart';
import 'package:map_app/services/location_service.dart';
import 'package:map_app/util.dart';

class MapService {
  final LocationService _locationService;

  MapService(this._locationService);

  Future<Set<Marker>> getMarkers() async {
    Set<Marker> markers = <Marker>{};
    List<Station> stationList = [];

    stationList = _getStations();

    markers.add(
      Marker(
        markerId: const MarkerId('user_location'),
        position: await _locationService.getUserLocation(),
        anchor: const Offset(0.5, 0.5),
        infoWindow: const InfoWindow(
          title: 'Your Location',
        ),
        icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/images/avatarPhoto.png'),
      ),
    );

    for (Station station in stationList) {
      String state = station.isAvailable();
      // markerID, position, title, icon

      int stationID = station.id;
      LatLng stationPosition = LatLng(station.latitude, station.longitude);
      String stationTitle = station.name;

      if (state == 'Available') {
        // GREEN MARK
        markers.add(
          Marker(
            markerId: MarkerId(stationID.toString()),
            position: stationPosition,
            infoWindow: InfoWindow(
              title: stationTitle,
            ),
            icon: await BitmapDescriptor.fromAssetImage(
                const ImageConfiguration(),
                'assets/images/StationGreenMarker.png'),
          ),
        );
      } else if (state == 'Unavailable') {
        // YELLOW MARK
        markers.add(
          Marker(
            markerId: MarkerId(stationID.toString()),
            position: stationPosition,
            infoWindow: InfoWindow(
              title: stationTitle,
            ),
            icon: await BitmapDescriptor.fromAssetImage(
                const ImageConfiguration(),
                'assets/images/StationYellowMarker.png'),
          ),
        );
      } else {
        // RED MARK
        markers.add(
          Marker(
            markerId: MarkerId(stationID.toString()),
            position: stationPosition,
            infoWindow: InfoWindow(
              title: stationTitle,
            ),
            icon: await BitmapDescriptor.fromAssetImage(
                const ImageConfiguration(),
                'assets/images/StationRedMarker.png'),
          ),
        );
      }
    }

    return markers;
  }

  List<Station> _getStations() {
    List<Station> stationList = [];

    List mapList = jsonDecode(
        stationsJSONstr); // The data is decoded from a string type and added to a list containing 'map'.

    for (var station in mapList) {
      stationList.add(Station.fromJson(
          station)); // Station objects created with the model class are included in the 'stationList'.
    }

    return stationList;
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
