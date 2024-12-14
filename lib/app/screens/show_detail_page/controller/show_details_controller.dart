import 'package:get/get.dart';
import 'package:netflix_task/app/models/show_model.dart';

class ShowDetailsController extends GetxController{
  late Rx<Show> show = Show(image: {}).obs;
  RxInt activeEpisode = 0.obs;

  @override
  void onInit() {
    show.value = Get.arguments['show'];
    super.onInit();
  }
}