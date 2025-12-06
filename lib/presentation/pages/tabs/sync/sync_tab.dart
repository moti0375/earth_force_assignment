import 'package:earth_force_assignment/core/offline_manager/offline_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SyncTab extends StatelessWidget {

  const SyncTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, OfflineManager manager, __) => AnimatedBuilder(
        animation: manager,
        builder: (_, __) => SwitchListTile(
          title: Text(
            "Offline Mode",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            manager.isOffline ? "App is in offline state" : "App is online",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          value: manager.isOffline,
          onChanged: (offline) => manager.setOfflineMode(offline),
          secondary: Icon(
            manager.isOffline ? Icons.wifi_off : Icons.wifi,
            size: 32,
            color: manager.isOffline ? Colors.redAccent : Colors.green,
          ),
        ),
      ),
    );
  }
}
