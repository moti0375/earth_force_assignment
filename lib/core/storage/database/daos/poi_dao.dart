import 'package:earth_force_assignment/core/storage/database/app_database.dart';

import 'package:drift/drift.dart';
import 'package:earth_force_assignment/core/storage/database/poi_table.dart';
import 'package:injectable/injectable.dart';
part 'poi_dao.g.dart';

@injectable
@DriftAccessor(tables: [PoiTable])
class PoiDao extends DatabaseAccessor<AppDatabase> with _$PoiDaoMixin {
  PoiDao(super.db);

  // Insert a POI
  Future<int> insertPoi(PoiTableCompanion poi) =>
      into(poiTable).insert(poi);

  // Watch entire POI list (if needed)
  Stream<List<PoiTableData>> watchAllPois() =>
      select(poiTable).watch();

  // Watch ONLY the most recently added POI
  Stream<PoiTableData?> watchLatestPoi() {
    final query = (select(poiTable)
      ..orderBy([(t) => OrderingTerm.desc(t.id)])
      ..limit(1));
    return query.watchSingleOrNull();
  }

  Future<List<PoiTableData>> readAllPois() => select(poiTable).get();
}
