import 'package:earth_force_assignment/core/data/model/location.dart';
import 'package:earth_force_assignment/core/data/model/poi.dart';
import 'package:earth_force_assignment/core/location/location_center.dart';
import 'package:earth_force_assignment/presentation/repositories/poi_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'map_tab_store.g.dart';

@injectable
class MapTabStore extends MapTabStoreBase with _$MapTabStore {
  MapTabStore(super._locationManager, super._poiRepository) : super();
}

abstract class MapTabStoreBase with Store {
  final LocationManager _locationManager;
  final PoiRepository _poiRepository;

  MapTabStoreBase(this._locationManager, this._poiRepository) {
    print("MapTabStore: created");
    _locationManager.locationStream().listen((location) {
      print("MapTabStore: location: ${location.latitude}");
      this.location = location;
      //setLocationChanged();
    });
  }

  @observable
  Location? location;

  @observable
  Poi? poi;

  @observable
  ObservableList<Marker> markers = ObservableList<Marker>();

  @action
  Future<void> initializeMap(LatLng initializeLocation) async {
    location = await _locationManager.getLastKnownLocation();
    _readAllPois();
  }

  @action
  Future<void> onMapClicked(LatLng position) async {
    print("onMapClicked: $position");
    Poi poi = Poi(
      latitude: position.latitude,
      longitude: position.longitude,
      createdAt: DateTime.now(),
      sent: false,
    );
    await _poiRepository.addPoi(poi);
  }

  void _listenPoiUpdates() {
    _poiRepository.poisUpdates().listen((poi) {
      print("onPoiUpdate: $poi");
      this.poi = poi;
      markers.add(
        Marker(
          markerId: MarkerId(poi.id.toString()),
          position: LatLng(poi.latitude, poi.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        ),
      );
    });
  }

  Future<void> _readAllPois() async {
    await _poiRepository.readAllPois().then((pois) {
      List<Marker> markers = pois
          .map(
            (poi) => Marker(
              markerId: MarkerId(poi.id.toString()),
              position: LatLng(poi.latitude, poi.longitude),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen,
              ),
            ),
          )
          .toList();

      print("readAllPois: there are ${markers.length} markers: $markers");
      this.markers.addAll(markers);
      _listenPoiUpdates();
    });
  }
}
