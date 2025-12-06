import 'package:earth_force_assignment/core/data/datasources/device_info_datasource.dart';
import 'package:earth_force_assignment/core/permission_center/permissions_center.dart';
import 'package:earth_force_assignment/di/locator_config.dart';
import 'package:earth_force_assignment/presentation/pages/tabs/device_properties/device_properties.dart';
import 'package:earth_force_assignment/presentation/pages/tabs/map/map_tab_page.dart';
import 'package:earth_force_assignment/presentation/pages/tabs/sync/sync_tab.dart';
import 'package:earth_force_assignment/presentation/pages/tabs_main/bloc/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_page_cubit.dart';

class MainTabsPage extends StatefulWidget {
  const MainTabsPage({super.key});

  @override
  State<MainTabsPage> createState() => _HomePageState();

  static Widget create() {
    print("MainTabsPage create");
    return BlocProvider<HomePageCubit>(
      create: (context) => getIt<HomePageCubit>(),
      child: const MainTabsPage(),
    );
  }
}

class _HomePageState extends State<MainTabsPage> {
  int _selectedIndex = 0;

  // List of pages (widgets)
  final List<Widget> _pages =  [
    MapTabPage.create(),
    DevicePropertiesTab.create(),
    const SyncTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Earth Force Assignment")),
      body: BlocConsumer<HomePageCubit, HomePageState>(
          builder: (_, state) {
            state.maybeWhen(orElse: (){}, initialState: (){
              context.read<HomePageCubit>().checkLocationPermissions();
            } );
            return _pages[_selectedIndex];
          },
          listener: (context, state) {
            state.maybeWhen(
                orElse: () {}, noLocationPermissions: (){
                _showLocationPermissionDialog(context);
            });
          }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Device Info",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }


    Future<void> _showLocationPermissionDialog(BuildContext context) async {
      return showDialog(
        context: context,
        barrierDismissible: false, // forces user to choose
        builder: (_) {
          return AlertDialog(
            title: const Text("Location Permission Required"),
            content: const Text(
              "This app needs access to your location in order to function properly.",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop(); // Close dialog
                 context.read<HomePageCubit>().requestLocationPermission();
                },
                child: const Text("Allow"),
              ),
            ],
          );
        },
      );
  }
}
