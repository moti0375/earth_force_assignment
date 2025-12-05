import 'package:geolocator/geolocator.dart';
import 'location.dart';

extension PositionToLocation on Position {
  Location toLocation({double? id}) {
    return Location(
      longitude: longitude,
      latitude: latitude,
      timestamp: timestamp ??  DateTime.now(),
      accuracy: accuracy,
      heading: (heading == 0.0) ? null : heading,
      speed: speed,
    );
  }
}