import 'package:freezed_annotation/freezed_annotation.dart';

part 'poi.freezed.dart';
part 'poi.g.dart';

@freezed
abstract class Poi with _$Poi {
  const factory Poi({
    int? id,
    required double latitude,
    required double longitude,
    required DateTime createdAt,
    required bool sent,
    required String description,
    String? imagePath,
  }) = _Poi;

  factory Poi.fromJson(Map<String, dynamic> json) => _$PoiFromJson(json);
}