import 'dart:async';

import 'package:earth_force_assignment/core/data/model/location.dart';
import 'package:earth_force_assignment/core/data/model/extensions.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationManager {
  Future<void> startLocationUpdates();
  Future<void> stopLocationUpdates();
  Stream<Location> locationStream();
  Future<Location> getLastKnownLocation();
}

class GeoLocationManager implements LocationManager {
  final StreamController<Position> _locationController =
      StreamController<Position>.broadcast();

  StreamSubscription<Position>? _positionSubscription;

  /// Clients listen to this stream
  Stream<Position> get locationChangesStream => _locationController.stream;

  @override
  Future<void> startLocationUpdates() async {
    _positionSubscription = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      ),
    ).listen((Position position) {
      _locationController.add(position);
    }, onError: (error) {
      _locationController.addError(error);
    });
  }

  @override
  Future<void> stopLocationUpdates() async {
    await _positionSubscription?.cancel();
    _positionSubscription = null;
  }

  @override
  Stream<Location> locationStream() {
    return _locationController.stream.map((position) => position.toLocation());
  }

  @override
  Future<Location> getLastKnownLocation() async {
    Position? position = await Geolocator.getLastKnownPosition();
    return position!.toLocation();
  }
}
