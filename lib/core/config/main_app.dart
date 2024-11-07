import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/route_utils.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QuranQu',
      getPages: RouteApp.pages,
      initialRoute: RouteApp.splashScreen,
    );
  }
}
