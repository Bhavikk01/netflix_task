import 'package:get/get.dart';
import 'package:netflix_task/app/screens/show_detail_page/controller/show_details_controller.dart';

class ShowDetailsBinding implements Bindings{

  @override
  void dependencies() {
    Get.put(ShowDetailsController());
  }

}