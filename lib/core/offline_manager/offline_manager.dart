import 'package:earth_force_assignment/core/network/sync_manager.dart';
import 'package:earth_force_assignment/presentation/repositories/poi_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';


@injectable
class OfflineManager extends ChangeNotifier {
  bool _isOffline = false;
  bool get isOffline => _isOffline;

  final PoiRepository poiRepository;
 final SyncManager _syncManager;

  OfflineManager(this.poiRepository, this._syncManager);

  void setOfflineMode(bool value) async {
    final wasOffline = _isOffline;
    _isOffline = value;
    notifyListeners();

    if (wasOffline && !_isOffline) {
      await _syncManager.sendPendingPois().then((response) {
        print("OfflineManager: setOfflineMode: $response");
      });
    }
  }
}
