import 'package:earth_force_assignment/core/data/model/poi.dart';
import 'package:earth_force_assignment/core/storage/database/app_database.dart';
import 'package:injectable/injectable.dart';

abstract class PoiLocalDatasource {
  Stream<Poi> watchLatestPoi();
  Future<void> addPoi(Poi poi);
}

@lazySingleton
class PoiLocalDatasourceImpl implements PoiLocalDatasource {
  final AppDatabase _appDatabase;
  PoiLocalDatasourceImpl(this._appDatabase);


  @override
  Stream<Poi> watchLatestPoi() {
    return _appDatabase.watchLatestPoi().map((row) {
      if (row == null) return null;
      return Poi(
        id: row.id,
        latitude: row.latitude,
        longitude: row.longitude,
        createdAt: row.createdAt,
        sent: row.sent,
      );
    }).where((poi) => poi != null).cast<Poi>();
  }

  @override
  Future<void> addPoi(Poi poi) async {
    await _appDatabase.insertPoi(
      PoiTableCompanion.insert(
        latitude: poi.latitude,
        longitude: poi.longitude,
        createdAt: poi.createdAt,
        sent: false
      ),
    );
  }
}