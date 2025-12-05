import 'package:earth_force_assignment/di/locator_config.dart';
import 'package:earth_force_assignment/presentation/pages/tabs/map/map_tab_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapTabPage extends StatefulWidget {
  final MapTabStore store;
  const MapTabPage({required this.store, super.key});

  @override
  State<MapTabPage> createState() => _MapTabPageState();

  static Widget create() {
    return Provider<MapTabStore>(
      create: (_) => getIt<MapTabStore>(),
      child: Consumer<MapTabStore>(
          builder: (context, store, child) => MapTabPage(
            store: store,
          )),
    );
  }
}

class _MapTabPageState extends State<MapTabPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Map Tab", style: TextStyle(fontSize: 24)));
  }
}
