import 'package:earth_force_assignment/presentation/repositories/poi_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';


@injectable
class OfflineManager extends ChangeNotifier {
  bool _isOffline = false;
  bool get isOffline => _isOffline;

  final PoiRepository poiRepository;
 // final SyncService syncService;

  OfflineManager(this.poiRepository);

  void setOfflineMode(bool value) async {
    final wasOffline = _isOffline;
    _isOffline = value;
    notifyListeners();

    // if (wasOffline && !_isOffline) {
    //   // System just returned online → trigger synchronization
    //   await syncService.syncPendingPois();
    // }
  }
}
