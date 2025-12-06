import 'dart:convert';
import 'dart:io';
import 'package:earth_force_assignment/core/data/datasources/poi_datasource.dart';
import 'package:earth_force_assignment/core/network/sync_result/sync_result.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class SyncManager {
  Future<SyncResult> sendPendingPois();
}

@injectable
class JsonServerSync implements SyncManager {
  final PoiLocalDatasource _datasource;
  JsonServerSync(this._datasource);


  @override
  Future<SyncResult> sendPendingPois() async {

    final unsyncedPois = await _datasource.readUnsyncedPois();
    final jsonList = unsyncedPois.map((p) => p.toJson()).toList();

    if(jsonList.isEmpty){
      print("No pois to upload, all up to date.");
      return Future.value(SyncResult.noOp());
    }

    final response = await http.post(
      Uri.parse("http://localhost:8080/pois"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(jsonList),
    );
    if (response.statusCode == 200) {
      int updated = await _datasource.updateSyncedPois(unsyncedPois.map((poi) => poi.id).toList().where((id) => id != null).cast<int>().toList());

      if(updated >= 0){
        return Future.value(SyncResult.success(syncedCount: updated));
      } else {
        return Future.value(const SyncResult.partialSuccess(message: "Failed to update pois"));
      }
    } else {
      return Future.value(SyncResult.networkError(message: "Failed to upload: ${response.statusCode}"));
    }
  }
}
