import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_app/services/location_service.dart';
import 'package:map_app/services/map_service.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

final locationServiceProvider =
    Provider<LocationService>((ref) => LocationService());
final mapServiceProvider = Provider<MapService>(
    (ref) => MapService(ref.read(locationServiceProvider)));
