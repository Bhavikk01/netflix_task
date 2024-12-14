import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/content_header.dart';
import '../../widgets/content_list.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/previews.dart';
import 'controller/dashboard_controller.dart';

class Dashboard extends GetView<DashboardController> {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
        onPressed: () => log('Cast'),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: const CustomAppBar()
      ),
      body: Obx(
        () => controller.showsList.isEmpty ? Container() : CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Obx(() => ContentHeader(featuredContent: controller.showsList[0])),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 10.0),
              sliver: SliverToBoxAdapter(
                child: Previews(
                  key: const PageStorageKey('previews'),
                  title: 'Previews',
                  contentList: controller.showsList,
                )
              ),
            ),
            SliverToBoxAdapter(
              child: ContentList(
                key: const PageStorageKey('myList'),
                title: 'My List',
                contentList: controller.showsList,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 20.0),
              sliver: SliverToBoxAdapter(
                child: ContentList(
                  key: const PageStorageKey('trending'),
                  title: 'Trending',
                  contentList: controller.showsList,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
