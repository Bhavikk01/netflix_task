import 'package:get/get.dart';
import 'package:netflix_task/app/screens/home_page/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}
