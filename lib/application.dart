import 'package:earth_force_assignment/navigation/routes.dart';
import 'package:earth_force_assignment/presentation/pages/tabs_main/main_tabs_page.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
               colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: ROOT,
      routes: {
        ROOT: (context) =>  MainTabsPage.create(),
      },
    );
  }
}
