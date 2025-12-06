import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'poi_input.freezed.dart';

@freezed
abstract class PoiInput with _$PoiInput {
  const factory PoiInput({
    required LatLng position, longitude,
    required String description,
    String? imagePath
  }) = _PoiInput;

}