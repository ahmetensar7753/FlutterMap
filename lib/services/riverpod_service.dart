import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_app/model/station_model.dart';
import 'package:map_app/services/location_service.dart';
import 'package:map_app/services/map_service.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

final locationServiceProvider =
    Provider<LocationService>((ref) => LocationService());
final mapServiceProvider = Provider<MapService>(
    (ref) => MapService(ref.read(locationServiceProvider)));

final cardStateProvider = StateProvider<bool>((ref) => false);

final cardDataProvider = StateProvider<Station>((ref) {
  return Station(
      id: -1,
      chargePointId: 'chargePointId',
      name: 'name',
      imageLink: 'imageLink',
      country: 'country',
      city: 'city',
      district: 'district',
      neighborhood: 'neighborhood',
      addressDetail: 'addressDetail',
      latitude: 0.0,
      longitude: 0.0,
      commentCount: 0,
      reviewStar: 0.0,
      stationType: 'stationType',
      about: 'about',
      closestPlacements: [],
      connectors: []);
});

final stationInfoContainerStateProvider = StateProvider<bool>((ref) => true);
