import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/data_controller.dart';
import 'package:junction2024_thrive_connect/controllers/navigation_controller.dart';
import 'package:junction2024_thrive_connect/extensions.dart';
import 'package:junction2024_thrive_connect/ui.dart';
import 'package:junction2024_thrive_connect/widgets/app_bottom_bar.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class ReelsPage extends GetView<DataController> {
  ReelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onHorizontalDragUpdate: (details) {
            if (details.primaryDelta != null) {
              if (details.primaryDelta! < -20) {
                Get.find<NavigationController>().pushToIndex(3);
              }
            }
          },
          child: Stack(
            children: [
              TikTokStyleFullPageScroller(
                contentSize: controller.teams.length,
                builder: (context, index) {
                  return Container(
                    // color: Colors.primaries[index % Colors.primaries.length],
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(controller.teams[index].img),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.black, Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Page $index",
                              style: AppFonts.h1.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              // Fixed Search Bar
              Positioned(
                top: kToolbarHeight + 24.0,
                left: 16.0,
                right: 16.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    style: AppFonts.bodyL.copyWith(
                      color: AppColors.grey,
                    ),
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: AppFonts.bodyL.copyWith(
                        color: AppColors.grey,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 12.0,
                      ),
                      suffixIcon: Padding(
                        padding: 24.0.paddingOnlyRight,
                        child: const Icon(Icons.search),
                      ),
                      suffixIconColor: AppColors.grey,
                      filled: true,
                      fillColor: AppColors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const AppBottomBar(),
      ),
    );
  }
}
