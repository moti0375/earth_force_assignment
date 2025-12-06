import 'package:earth_force_assignment/core/network/local_server_service.dart';
import 'package:earth_force_assignment/di/locator_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  configureDependencies();
  await getIt<LocalServerService>().start();
  runApp(const MyApp());
}