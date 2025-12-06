import 'package:earth_force_assignment/core/data/datasources/device_info_datasource.dart';
import 'package:earth_force_assignment/core/data/model/device_properties.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeviceStatusNotifier with ChangeNotifier {
  final PlatformDeviceInfoDatasource _deviceInfoDatasource;

  DeviceStatusNotifier(this._deviceInfoDatasource);

  DeviceProperties? properties;

  void init() {
    print("DeviceStatusNotifier: _init");
    _deviceInfoDatasource.deviceProperties().listen((data) {
      _mapDataToDeviceState(data);

      print("deviceProperties: $data");
      notifyListeners();
    });
  }

  void _mapDataToDeviceState(Map<String, dynamic> data) {
    print("deviceProperties: $data");
    switch (data["type"] as String) {
      case "batteryStatus":
        {
          _updateBatteryStatus(Map<String, dynamic>.from(data["payload"]));
          break;
        }
    }
  }

  void _updateBatteryStatus(Map<String, dynamic> batteryStatus) {
    int level = batteryStatus["batteryLevel"] as int;
    bool isCharging = batteryStatus["isCharging"] as bool;

    properties = properties != null ? properties?.copyWith(
      batteryLevel: level,
      isCharging: isCharging,
    ) : DeviceProperties(
      batteryLevel: level,
      isCharging: isCharging,
      model: "",
      manufacturer: "",
    );
    notifyListeners();
  }
}
