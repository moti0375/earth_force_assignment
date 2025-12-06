import 'package:earth_force_assignment/ui/device_properties_tile.dart';
import 'package:flutter/material.dart';

class DeviceInfoTabletLayout extends StatelessWidget {
  final int batteryLevel;
  final bool isCharging;
  final String manufacturer;
  final String model;

  const DeviceInfoTabletLayout({
    super.key,
    required this.batteryLevel,
    required this.isCharging,
    required this.manufacturer,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 32,
        mainAxisSpacing: 32,
        childAspectRatio: 2.5,
        children: [
          DevicePropertyTile(
            icon: getBatteryIcon(batteryLevel, isCharging),
            title: "Battery Level",
            value: "$batteryLevel%",
          ),
          DevicePropertyTile(
            icon: getChargingIcon(isCharging),
            title: "Charging",
            value: isCharging ? "Connected" : "Not Charging",
          ),
          DevicePropertyTile(
            icon: Icons.factory,
            title: "Manufacturer",
            value: manufacturer,
          ),
          DevicePropertyTile(
            icon: Icons.phone_android,
            title: "Model",
            value: model,
          ),
        ],
      ),
    );
  }

  IconData getBatteryIcon(int level, bool isCharging) {
    if (isCharging) {
      return Icons.battery_charging_full;
    }

    if (level >= 75) {
      return Icons.battery_full;
    } else if (level >= 50) {
      return Icons.battery_6_bar;
    } else if (level >= 25) {
      return Icons.battery_3_bar;
    } else {
      return Icons.battery_alert;
    }
  }

  IconData getChargingIcon(bool isCharging) {
    return isCharging ? Icons.power : Icons.power_off;
  }
}
