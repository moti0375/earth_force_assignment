import 'package:earth_force_assignment/di/locator_config.dart';
import 'package:earth_force_assignment/presentation/pages/tabs/device_properties/device_properties_notifier.dart';
import 'package:earth_force_assignment/ui/device_properties_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DevicePropertiesTab extends StatefulWidget {
  const DevicePropertiesTab({super.key});

  @override
  State<DevicePropertiesTab> createState() => _DevicePropertiesTabState();

  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => getIt<DeviceStatusNotifier>()..init(),
      child: const DevicePropertiesTab(),
    );
  }
}

class _DevicePropertiesTabState extends State<DevicePropertiesTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DeviceStatusNotifier>(
      builder: (_, notifier, __) {
        return AnimatedBuilder(animation: notifier, builder: (_, _) {
          final s = notifier.properties;
          if (s == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return DeviceInfoTabletLayout(
              batteryLevel: s.batteryLevel,
              isCharging: s.isCharging,
              manufacturer: s.manufacturer,
              model: s.model,
            );}
        });
      });
  }
}
