// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_app/constants/colors.dart';
import 'package:map_app/services/riverpod_service.dart';
import 'package:map_app/util.dart';
import 'package:map_app/widgets/MapStationCardWidget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapService = ref.watch(mapServiceProvider);
    final locationService = ref.watch(locationServiceProvider);

    TextEditingController searchTextController = TextEditingController();

    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            _createMapWidget(context, mapService, locationService, ref),
            Positioned(
                top: 0, child: _createSearchBar(context, searchTextController)),
            const StationCardWidget(),
          ],
        ),
      ),
    );
  }

  FutureBuilder _createMapWidget(BuildContext context, var mapService,
      var locationService, WidgetRef ref) {
    return FutureBuilder(
        future: mapService.getMarkers(context, ref),
        builder: (context, snapshot1) {
          if (snapshot1.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot1.hasError) {
            return Text('Error: ${snapshot1.error}');
          } else if (!snapshot1.hasData) {
            return const Text('No data available');
          } else {
            return FutureBuilder<LatLng>(
                future: locationService.getUserLocation(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData) {
                    return const Text('No data available');
                  } else {
                    // CREATE CIRCLE
                    LatLng latLng = snapshot.data!;
                    for (Marker marker in snapshot1.data) {
                      if (marker.markerId.toString() == 'user_location') {
                        latLng = marker.position;
                      }
                    }
                    Set<Circle> circles = {
                      Circle(
                        circleId: const CircleId('circle1'),
                        center: latLng,
                        radius: 60,
                        fillColor: MyColor.trGreen.withOpacity(0.1),
                        strokeWidth: 0,
                      ),
                      Circle(
                        circleId: const CircleId('circle2'),
                        center: latLng,
                        radius: 120,
                        fillColor: MyColor.trGreen.withOpacity(0.1),
                        strokeWidth: 0,
                      ),
                    };
                    return GoogleMap(
                      onTap: (position) {
                        ref.watch(cardStateProvider.notifier).state = false;
                      },
                      mapToolbarEnabled:
                          false, // The custom toolbar has been created
                      compassEnabled: false,
                      myLocationButtonEnabled:
                          false, // It has been added to the custom toolbar.
                      markers: snapshot1.data!,
                      zoomControlsEnabled: false,
                      fortyFiveDegreeImageryEnabled: true,
                      buildingsEnabled: false,
                      circles: circles,
                      onMapCreated: (GoogleMapController controller) {
                        // The custom map style was created with 'Styling Wizard: Google Maps' and added to the widget as a JSON.
                        controller.setMapStyle(mapStyleJSON);
                      },
                      initialCameraPosition: CameraPosition(
                        target: snapshot
                            .data!, // The camera position starts from the user location.
                        zoom: 17.0,
                      ),
                    );
                  }
                }));
          }
        });
  }

  Widget _createSearchBar(
      BuildContext context, TextEditingController controller) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            MyColor.trGreen.withOpacity(0.5),
            MyColor.trGreen.withOpacity(0.01),
          ],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 25, right: 25, top: 60, bottom: 22),
        width: MediaQuery.of(context).size.width - 50, // horizontal margin 50
        height: 150 - 82, // vertical margin 82
        decoration: BoxDecoration(
          color: MyColor.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: 150,
                height: 50,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: MyColor.g100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      'assets/images/Search.png',
                      color: MyColor.g400,
                    ),
                    hintText: 'Search station',
                    hintStyle: const TextStyle(
                        color: MyColor.g400,
                        fontFamily: 'Urbanist',
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                      color: MyColor.black,
                      fontFamily: 'Urbanist',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.only(
                    left: 5, top: 10, bottom: 10, right: 10),
                decoration: BoxDecoration(
                  color: MyColor.g100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/Filter.png',
                    color: MyColor.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
