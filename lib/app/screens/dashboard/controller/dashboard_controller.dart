import 'dart:developer';

import 'package:get/get.dart';
import 'package:netflix_task/app/models/show_model.dart';
import 'package:netflix_task/app/services/api_client.dart';

class DashboardController extends GetxController {
  RxList<ShowModel> showsList = <ShowModel>[].obs;


  @override
  void onInit() async {
    await fetchShows();
  }

  Future<void> fetchShows() async {
    showsList.clear();
    ApiClient.to.getAllShows(
      onSuccess: (Response res) {
        for(var show in res.body){
          showsList.add(ShowModel.fromJson(show));
        }
        log("printing data: ${showsList.first.show!.id!}");
      },
      onError: (Response res) {
        log("Error fetching shows: ${res.body}");
      },
    );
  }
}
