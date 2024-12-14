import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_task/app/routes/app_pages.dart';
import 'package:netflix_task/app/screens/search_page/controller/search_controller.dart';
import 'package:netflix_task/app/widgets/content_list.dart';
import 'package:netflix_task/app/widgets/search_show_card.dart';

import '../../data.dart';

class SearchPage extends GetView<SearchShowController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(context),
      body: Obx(() => controller.searchShow.isEmpty ?  getBody(context) : getSearchBody(context)),
    );
  }

  PreferredSizeWidget getAppBar(context) {
    var size = MediaQuery
        .of(context)
        .size;
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Container(
        width: size.width,
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.withOpacity(0.25)),
        child: TextField(
          controller: controller.searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey.withOpacity(0.7),
            ),
          ),
          onChanged: (text){
            controller.searchShows();
          },
        ),
      ),
    );
  }

  Widget getBody(context) {
    var size = MediaQuery
        .of(context)
        .size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 18, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Top Searches",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            Column(
                children: List.generate(searchJson.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        Routes.showDetailsPage,
                        arguments: {"show": controller.searchShow[index].show},
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: (size.width - 36) * 0.8,
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                          image:
                                          AssetImage(searchJson[index]['img']),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 70,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      width: 160,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.2),
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        searchJson[index]['title'],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: (size.width - 36) * 0.2,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 2, color: Colors.white),
                                color: Colors.black.withOpacity(0.4),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }))
          ],
        ),
      ),
    );
  }

  Widget getSearchBody(context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          direction: Axis.horizontal,
          runSpacing: 30,
          spacing: 20,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: List.generate(controller.searchShow.length, (index) {
            return GestureDetector(
              onTap: (){
                Get.toNamed(Routes.showDetailsPage, arguments: {
                  "show": controller.searchShow[index].show
                });
              },
              child: SearchShowCard(
                show: controller.searchShow[index],
              ),
            );
          }),
        ),
      ),
    );
  }
}
