import 'package:earth_force_assignment/core/offline_manager/offline_manager.dart';
import 'package:earth_force_assignment/di/locator_config.dart';
import 'package:earth_force_assignment/navigation/routes.dart';
import 'package:earth_force_assignment/presentation/pages/tabs_main/main_tabs_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<OfflineManager>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
                 colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: ROOT,
        routes: {
          ROOT: (context) =>  MainTabsPage.create(),
        },
      ),
    );
  }
}
