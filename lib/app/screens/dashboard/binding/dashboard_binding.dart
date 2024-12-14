import 'package:get/get.dart';
import 'package:netflix_task/app/screens/dashboard/controller/dashboard_controller.dart';

class DashboardBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}