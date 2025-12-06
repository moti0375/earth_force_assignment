import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_properties.freezed.dart';
part 'device_properties.g.dart';

@freezed
abstract class DeviceProperties with _$DeviceProperties {
  const factory DeviceProperties({
    required int batteryLevel,
    required bool isCharging,
    required String manufacturer,
    required String model
  }) = _DeviceProperties;

  factory DeviceProperties.fromJson(Map<String, dynamic> json) => _$DevicePropertiesFromJson(json);
}