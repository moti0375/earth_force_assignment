
import 'package:earth_force_assignment/core/offline_manager/offline_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class OfflineStatusIcon extends StatelessWidget {
  const OfflineStatusIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<OfflineManager>(
      builder: (context, manager, _) {
        final isOffline = manager.isOffline;

        return Icon(
          isOffline ? Icons.wifi_off : Icons.wifi,
          color: isOffline ? Colors.redAccent : Colors.green,
        );
      },
    );
  }
}
