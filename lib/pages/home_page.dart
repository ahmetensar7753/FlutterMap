import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_app/services/riverpod_service.dart';
import 'package:map_app/util.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapService = ref.watch(mapServiceProvider);
    final locationService = ref.watch(locationServiceProvider);

    return Scaffold(
        body: SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: FutureBuilder(
          future: mapService.getMarkers(),
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
                      return GoogleMap(
                        mapToolbarEnabled:
                            false, // The custom toolbar has been created
                        myLocationEnabled: true,
                        myLocationButtonEnabled:
                            false, // It has been added to the custom toolbar.
                        markers: snapshot1.data!,
                        zoomControlsEnabled: false,
                        fortyFiveDegreeImageryEnabled: true,
                        buildingsEnabled: false,

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
          }),
    ));
  }
}
