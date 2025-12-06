import 'package:drift/drift.dart';

class PoiTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get sent => boolean().withDefault(const Constant(false))();
}
