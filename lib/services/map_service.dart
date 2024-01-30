import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_app/constants/colors.dart';
import 'package:map_app/model/station_model.dart';
import 'package:map_app/services/location_service.dart';
import 'package:map_app/services/riverpod_service.dart';
import 'package:map_app/util.dart';
import 'package:map_app/widgets/CustomInfoWidget.dart';

class MapService {
  final LocationService _locationService;

  MapService(this._locationService);

  Future<Set<Marker>> getMarkers(BuildContext context, WidgetRef ref) async {
    Set<Marker> markers = <Marker>{};
    List<Station> stationList = [];

    stationList = _getStations();

    LatLng position = await _locationService.getUserLocation();

    markers.add(
      Marker(
        markerId: const MarkerId('user_location'),
        position: position,
        anchor: const Offset(0.5, 0.5),
        onTap: () {
          showOverlay(context, 'My Location', MyColor.black, MyColor.black);
        },
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
            onTap: () {
              openCard(ref, station);
              showOverlay(context, stationTitle, MyColor.primaryGradient,
                  MyColor.primary);
            },
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
            onTap: () {
              openCard(ref, station);
              showOverlay(
                  context, stationTitle, MyColor.yellow, MyColor.trYellow);
            },
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
            onTap: () {
              openCard(ref, station);
              showOverlay(
                  context, stationTitle, MyColor.trRedGradient, MyColor.trRed);
            },
            icon: await BitmapDescriptor.fromAssetImage(
                const ImageConfiguration(),
                'assets/images/StationRedMarker.png'),
          ),
        );
      }
    }

    return markers;
  }

  void openCard(WidgetRef ref, Station station) async {
    ref.read(cardStateProvider.notifier).state = true;
    ref.read(cardDataProvider.notifier).state = station;
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

  void showOverlay(
      BuildContext context, String data, Color color1, Color color2) {
    OverlayEntry overlayEntry =
        OverlayEntry(builder: (context) => const SizedBox());
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        top: 160,
        right: 8,
        child: GestureDetector(
            onTap: () => overlayEntry.remove(),
            child: YourCustomWidget(
              color: color1,
              color2: color2,
              data: data,
            )),
      );
    });

    Overlay.of(context).insert(overlayEntry);
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
