import 'dart:convert';
import 'dart:io';
import 'package:earth_force_assignment/core/data/datasources/poi_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class SyncManager {
  Future<http.Response> sendPendingPois();
}

@injectable
class JsonServerSync implements SyncManager {
  final PoiLocalDatasource _datasource;
  JsonServerSync(this._datasource);


  @override
  Future<http.Response> sendPendingPois() async {

    final unsyncedPois = await _datasource.readUnsyncedPois();
    final jsonList = unsyncedPois.map((p) => p.toJson()).toList();
    final response = await http.post(
      Uri.parse("http://localhost:8080/pois"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(jsonList),
    );
    if (response.statusCode == 200) {
      int updated = await _datasource.updateSyncedPois(unsyncedPois.map((poi) => poi.id).toList().where((id) => id != null).cast<int>().toList());
      print("Uploaded POIs successfully, updated: $updated pois");
    } else {
      print("Failed to upload: ${response.statusCode}");
    }
    return response;
  }
}
