import 'package:get/get.dart';
import 'package:netflix_task/app/screens/show_detail_page/binding/show_details_binding.dart';
import 'package:netflix_task/app/screens/show_detail_page/show_details_page.dart';
import 'package:netflix_task/main.dart';

import '../screens/home_page/binding/home_binding.dart';
import '../screens/home_page/home_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [

    /// Home Page
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.showDetailsPage,
      page: () => const ShowDetailsPage(),
      binding: ShowDetailsBinding()
    ),
  ];
}
