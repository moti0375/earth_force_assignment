import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'poi_table.dart';

part 'app_database.g.dart';

@injectable
@DriftDatabase(tables: [PoiTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Stream all POIs
  Stream<List<PoiTableData>> watchPois() {
    return select(poiTable).watch();
  }

  Future<int> insertPoi(PoiTableCompanion entry) {
    return into(poiTable).insert(entry);
  }

  Stream<PoiTableData?> watchLatestPoi() {
    return (select(poiTable)
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.id)])
      ..limit(1))
        .watchSingleOrNull();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.db'));
    print("_openConnection db file: ${file.path}");
    return NativeDatabase(file);
  });
}
