
import 'package:earth_force_assignment/core/data/model/location.dart';
import 'package:earth_force_assignment/core/location/location_center.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'map_tab_store.g.dart';

@injectable
class MapTabStore extends MapTabStoreBase with _$MapTabStore{
  MapTabStore(super._locationManager) : super();
}

abstract class MapTabStoreBase with Store {
  final LocationManager _locationManager;
  MapTabStoreBase(this._locationManager){

    print("MapTabStore: created");
    _locationManager.locationStream().listen((location) {
      print("MapTabStore: location: ${location.latitude}");
      this.location = location;
      //setLocationChanged();
    });
  }

  @observable
  Location? location;

  @action
  void initializeMap(LatLng initializeLocation) async {
    Location currentLocation = await _locationManager.getLastKnownLocation();
    location = currentLocation;
  }

  @action
  void setLocationChanged(LatLng position, {bool justLocation = false}){
    print("setLocationChanged: $position");
    location = Location(longitude: position.longitude, latitude: position.longitude, speed: 0.0);
  }
}