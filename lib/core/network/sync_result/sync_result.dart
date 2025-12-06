import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_result.freezed.dart';

@freezed
sealed class SyncResult with _$SyncResult {
  /// Nothing to sync
  const factory SyncResult.noOp() = SyncNoOp;

  /// All POIs synced successfully
  const factory SyncResult.success({
    required int syncedCount,
  }) = SyncSuccess;

  /// Some POIs synced, some failed
  const factory SyncResult.partialSuccess({
   required String message,
  }) = SyncPartialSuccess;

  /// Network failure (server unreachable, non-200, etc)
  const factory SyncResult.networkError({
    required String message,
  }) = SyncNetworkError;

  /// Unexpected internal error
  const factory SyncResult.failure({
    required String message,
    Object? error,
  }) = SyncFailure;
}
