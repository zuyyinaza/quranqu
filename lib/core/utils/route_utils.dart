// ignore_for_file: unused_import

import 'package:get/get.dart';
import '../../features/screen/home_screen.dart';
import '../../features/screen/splash_screen.dart';
import '../../features/screen/surahdetail_screen.dart';
import '../config/main_app.dart';

class RouteApp {
  static const splashScreen = '/';
  static const homeScreen = '/home';
  static const surahDetailScreen = '/surah_detail';

  static List<GetPage> pages = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: surahDetailScreen, page: () => SurahDetailScreen()),
  ];
}
