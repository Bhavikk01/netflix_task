import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netflix_task/app/controller/bottom_nav_controller.dart';
import 'package:netflix_task/app/models/enum/nested_navigation.dart';
import 'package:netflix_task/app/routes/app_pages.dart';
import 'package:netflix_task/app/screens/dashboard/dashboard.dart';

import '../dashboard/binding/dashboard_binding.dart';
import '../search_page/binding/search_binding.dart';
import '../search_page/search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final  bottomNavController = Get.find<BottomNavBarController>();

  @override
  Widget build(BuildContext context) {
    NestedNavigation nestedNavigation = NestedNavigation.dashboardScreen;
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(nestedNavigation.navID!),
        initialRoute: Routes.dashboard,
        onGenerateRoute: (settings){
          switch(settings.name){
            case Routes.dashboard:
              return GetPageRoute(
                page: () => const Dashboard(),
                binding: DashboardBinding(),
                maintainState: true,
                transition: Transition.fadeIn,
              );
            case Routes.searchPage:
              return GetPageRoute(
                page: () => const SearchPage(),
                binding: SearchBinding(),
                maintainState: true,
                transition: Transition.fadeIn,
              );
            default:
              return GetPageRoute(
                page: () => const Dashboard(),
                maintainState: true,
                transition: Transition.fadeIn,
              );
          }
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          unselectedItemColor: Colors.white30,
          selectedItemColor: Colors.white,
          currentIndex: bottomNavController.currentIndex.value,
          onTap: (index){
            bottomNavController.currentIndex.value = index;
            if(index == 0){
              Get.toNamed(Routes.dashboard, id: nestedNavigation.navID!);
            }else{
              Get.toNamed(Routes.searchPage, id: nestedNavigation.navID!);
            }
          },
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home_icon.svg',
                color: bottomNavController.currentIndex.value == 0
                    ? Colors.white
                    : Colors.white30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/search_icon.svg',
                  color: bottomNavController.currentIndex.value == 1
                      ? Colors.white
                      : Colors.white30,
                ),
                label: 'Search'
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
