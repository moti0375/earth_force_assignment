import 'package:flutter/material.dart';

class OfflineSwitchTile extends StatelessWidget {
  final bool isOffline;
  final ValueChanged<bool> onChanged;

  const OfflineSwitchTile({super.key, required this.isOffline, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        "Offline Mode",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(
        isOffline ? "App is in offline state" : "App is online",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      value: isOffline,
      onChanged: onChanged,
      secondary: Icon(
        isOffline ? Icons.wifi_off : Icons.wifi,
        size: 32,
        color: isOffline ? Colors.redAccent : Colors.green,
      ),
    );
  }
}
