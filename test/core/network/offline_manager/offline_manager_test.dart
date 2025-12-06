import 'package:earth_force_assignment/core/network/sync_manager.dart';
import 'package:earth_force_assignment/core/network/sync_result/sync_result.dart';
import 'package:earth_force_assignment/core/offline_manager/offline_manager.dart';
import 'package:earth_force_assignment/presentation/repositories/poi_repository.dart';
import 'package:earth_force_assignment/utils/toast_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockToastService extends Mock implements ToastService {}
class MockPoiRepository extends Mock implements PoiRepository {}
class MockSyncManager extends Mock implements SyncManager {}

void main() {
  late MockPoiRepository repo;
  late MockSyncManager sync;
  late MockToastService toast;
  late OfflineManager manager;

  setUp(() {
    repo = MockPoiRepository();
    sync = MockSyncManager();
    toast = MockToastService();

    manager = OfflineManager(repo, sync, toast);
  });

  test("Going online triggers sync and shows success toast", () async {
    await manager.setOfflineMode(true); // start offline

    when(() => sync.sendPendingPois())
        .thenAnswer((_) async => const SyncResult.success(syncedCount: 2));

    await manager.setOfflineMode(false); // go online → should sync

    verify(() => sync.sendPendingPois()).called(1);
    verify(() => toast.showToast("Successfully synced 2 items!")).called(1);
  });

  test("No-op toast", () async {
    await manager.setOfflineMode(true);

    when(() => sync.sendPendingPois())
        .thenAnswer((_) async => const SyncResult.noOp());

    await manager.setOfflineMode(false);

    verify(() => toast.showToast("Nothing to sync")).called(1);
  });

  test("Network error toast", () async {
    await manager.setOfflineMode(true);

    when(() => sync.sendPendingPois())
        .thenAnswer((_) async => const SyncResult.networkError(message: "fail"));

    await manager.setOfflineMode(false);

    verify(() => toast.showToast("Network error: fail")).called(1);
  });
}
