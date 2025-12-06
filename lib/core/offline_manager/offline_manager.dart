import 'package:earth_force_assignment/core/network/sync_manager.dart';
import 'package:earth_force_assignment/core/network/sync_result/sync_result.dart';
import 'package:earth_force_assignment/presentation/repositories/poi_repository.dart';
import 'package:earth_force_assignment/utils/toast_service.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';



@injectable
class OfflineManager extends ChangeNotifier {
  bool _isOffline = false;

  bool get isOffline => _isOffline;

  final PoiRepository poiRepository;
  final SyncManager _syncManager;
  final ToastService _toastService;

  OfflineManager(this.poiRepository, this._syncManager, this._toastService);

  void setOfflineMode(bool value) async {
    final wasOffline = _isOffline;
    _isOffline = value;
    notifyListeners();

    if (wasOffline && !_isOffline) {
      SyncResult result = await _syncManager.sendPendingPois();

      result.when(
        noOp: () {
          _showToast("Nothing to sync");
        },
        success: (count) {
          _showToast("Successfully synced $count items!");
        },
        partialSuccess: (message) {
          _showToast("Partial sync: $message");
        },
        networkError: (msg) {
          _showToast("Network error: $msg");
        },
        failure: (msg, error) {
          _showToast("Sync failed: $msg");
        },
      );
    }
  }

  void _showToast(String message) {
    _toastService.showToast(
       message,
    );
  }
}
