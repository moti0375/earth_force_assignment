import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.g.dart';
part 'location.freezed.dart';

@freezed
abstract class Location with _$Location {
  const factory Location({
    required double longitude,
    required double latitude,
    DateTime? timestamp,
    double? accuracy,
    double? heading,
    required double speed
  }) = _Location;

  factory Location.fromJson(Map<String, Object?> json)
  => _$LocationFromJson(json);
}