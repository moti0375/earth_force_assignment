import 'package:earth_force_assignment/core/data/datasources/poi_datasource.dart';
import 'package:earth_force_assignment/core/data/model/poi.dart';
import 'package:injectable/injectable.dart';

abstract class PoiRepository {
    Stream<Poi> poisUpdates();
    Future<void> addPoi(Poi poi);
}

@lazySingleton
class PoiRepositoryImpl implements PoiRepository {
  final PoiLocalDatasource _poiLocalDatasource;
  PoiRepositoryImpl(this._poiLocalDatasource);

  @override
  Stream<Poi> poisUpdates() {
    return _poiLocalDatasource.watchLatestPoi();
  }

  @override
  Future<void> addPoi(Poi poi) {
    return _poiLocalDatasource.addPoi(poi);
  }



}
