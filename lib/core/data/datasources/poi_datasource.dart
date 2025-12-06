import 'package:drift/drift.dart';
import 'package:earth_force_assignment/core/data/model/poi.dart';
import 'package:earth_force_assignment/core/storage/database/app_database.dart';
import 'package:earth_force_assignment/core/storage/database/daos/poi_dao.dart';
import 'package:injectable/injectable.dart';

abstract class PoiLocalDatasource {
  Stream<Poi> watchLatestPoi();

  Future<void> addPoi(Poi poi);

  Future<List<Poi>> readAllPois();

  Future<List<Poi>> readUnsyncedPois();

  Future<int> updateSyncedPois(List<int> pois);
}

@lazySingleton
class PoiLocalDatasourceImpl implements PoiLocalDatasource {
  final PoiDao _poiDao;

  PoiLocalDatasourceImpl(this._poiDao);

  @override
  Stream<Poi> watchLatestPoi() {
    return _poiDao
        .watchLatestPoi()
        .map((row) {
      if (row == null) return null;
      return Poi(
        id: row.id,
        latitude: row.latitude,
        longitude: row.longitude,
        createdAt: row.createdAt,
        sent: row.sent,
        description: row.description,
        imagePath: row.imagePath,
      );
    })
        .where((poi) => poi != null)
        .cast<Poi>();
  }

  @override
  Future<void> addPoi(Poi poi) async {
    await _poiDao.insertPoi(
      PoiTableCompanion.insert(
          latitude: poi.latitude,
          longitude: poi.longitude,
          createdAt: poi.createdAt,
          description: poi.description,
          imagePath: Value(poi.imagePath),
          sent: const Value<bool>(false),
    ),);
  }

  @override
  Future<List<Poi>> readAllPois() async {
    List<PoiTableData> pois = await _poiDao.readAllPois();
    return pois
        .map(
          (poiData) =>
          Poi(
            id: poiData.id,
            latitude: poiData.latitude,
            longitude: poiData.longitude,
            createdAt: poiData.createdAt,
            sent: poiData.sent,
            description: poiData.description,
            imagePath: poiData.imagePath
          ),
    )
        .toList();
  }

  @override
  Future<List<Poi>> readUnsyncedPois() async {
    List<PoiTableData> pois = await _poiDao.readUnsyncedPois();
    return pois
        .map(
          (poiData) =>
          Poi(
              id: poiData.id,
              latitude: poiData.latitude,
              longitude: poiData.longitude,
              createdAt: poiData.createdAt,
              sent: poiData.sent,
              description: poiData.description,
              imagePath: poiData.imagePath
          ),
    ).toList();
  }

  @override
  Future<int> updateSyncedPois(List<int> pois) async {
    return await _poiDao.markSyncedPois(pois);
  }
}
