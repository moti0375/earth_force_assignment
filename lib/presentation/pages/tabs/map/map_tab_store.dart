import 'package:earth_force_assignment/core/data/model/location.dart';
import 'package:earth_force_assignment/core/data/model/poi.dart';
import 'package:earth_force_assignment/core/location/location_center.dart';
import 'package:earth_force_assignment/presentation/pages/tabs/map/poi_input.dart';
import 'package:earth_force_assignment/presentation/repositories/poi_repository.dart';
import 'package:earth_force_assignment/ui/emoji_maker.dart';
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

  late BitmapDescriptor treeMarker;

  MapTabStoreBase(this._locationManager, this._poiRepository)  {
    print("MapTabStore: created");
    _init();

  }

  _init() async {
    await setMarkerDescriptor();
    _listenToLocationUpdates();
    _readAllPois();
  }

  @action
  Future<void> setMarkerDescriptor() async {
    treeMarker = await EmojiMarker.create("🌳", size: 80);
  }

  @observable
  Location? location;

  @observable
  Poi? poi;

  @observable
  ObservableList<Marker> markers = ObservableList<Marker>();

  @action
  Future<void> onMapClicked(PoiInput poiInput) async {
    print("onMapClicked: $poiInput");
    Poi poi = Poi(
      latitude: poiInput.position.latitude,
      longitude: poiInput.position.longitude,
      createdAt: DateTime.now(),
      sent: false,
      description: poiInput.description,
      imagePath: poiInput.imagePath,
    );
    await _poiRepository.addPoi(poi);
  }

  void _listenToLocationUpdates() {
    _locationManager.locationStream().listen((location) {
      print("MapTabStore: location: ${location.latitude}");
      this.location = location;
    });
  }

  void _listenPoiUpdates() {
    _poiRepository.poisUpdates().listen((poi) {
      print("onPoiUpdate: $poi");
      this.poi = poi;
      _updateMarkerList([poi]);
    });
  }

  void _updateMarkerList(List<Poi> pois) async {
    List<Marker> markers = pois
        .map(
          (poi) => Marker(
            markerId: MarkerId(poi.id.toString()),
            position: LatLng(poi.latitude, poi.longitude),
            infoWindow: InfoWindow(
              title: poi.description,
              snippet: poi.imagePath != null ? "Image attached" : null,
            ),
            icon: treeMarker,
          ),
        )
        .toList();

    this.markers.addAll(markers);
  }

  Future<void> _readAllPois() async {
    print("_readAllPois: ");
    await _poiRepository
        .readAllPois()
        .then((pois) {
          print("readAllPois: $pois");
          _updateMarkerList(pois);
          _listenPoiUpdates();
        })
        .onError((error, stackTrace) {
          print("readAllPois: error: $error");
        });
  }


}
