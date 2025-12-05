
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'map_tab_store.g.dart';

@injectable
class MapTabStore extends MapTabStoreBase with _$MapTabStore{
  MapTabStore() : super();
}

abstract class MapTabStoreBase with Store {
  MapTabStoreBase();
  @observable
  LatLng? location;

  // @observable
  // CreateOrEditAction? createOrEditAction;

  @action
  void initializeMap(LatLng initializeLocation){
    setLocationChanged(initializeLocation, justLocation: true);

  }

  @action
  void setLocationChanged(LatLng position, {bool justLocation = false}){
    print("setLocationChanged: $position");
    location = position;

   // createOrEditAction = OnLocationUpdated(position: position);
  }
}