import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:netflix_task/app/models/show_model.dart';
import 'package:netflix_task/app/services/api_client.dart';

class SearchShowController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxList<ShowModel> searchShow = <ShowModel>[].obs;

  searchShows() {
    if (searchController.text.isEmpty) {
      searchShow.clear();
    } else {
      ApiClient.to.searchShow(
        searchController.text,
        onSuccess: (Response res) {
          searchShow.clear();
          for (var show in res.body) {
            searchShow.add(ShowModel.fromJson(show));
          }
        },
        onError: (Response res) {
          log(res.toString());
        },
      );
    }
  }
}
