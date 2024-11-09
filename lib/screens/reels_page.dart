import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/data_controller.dart';
import 'package:junction2024_thrive_connect/controllers/navigation_controller.dart';
import 'package:junction2024_thrive_connect/extensions.dart';
import 'package:junction2024_thrive_connect/ui.dart';
import 'package:junction2024_thrive_connect/widgets/app_bottom_bar.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class ReelsPage extends GetView<DataController> {
  ReelsPage({
    super.key,
    this.teamIndexController,
  });

  final Controller? teamIndexController;

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<NavigationController>();
    final scrollerController = teamIndexController ?? Controller();

    scrollerController.addListener((event) {
      if ((event.direction == ScrollDirection.FORWARD ||
              event.direction == ScrollDirection.BACKWARDS) &&
          event.pageNo != null &&
          event.pageNo! >= 0) {
        navigationController.setCurrentTeam(event.pageNo!);
      }
    });

    return PopScope(
      canPop: false,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
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
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.3),
                    ],
                    stops: const [
                      0.08,
                      0.21,
                      0.55,
                      0.93,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Obx(
                  () => TikTokStyleFullPageScroller(
                    controller: scrollerController,
                    contentSize: controller.filteredJobOffers.length,
                    builder: (context, index) {
                      final jobOffer = controller.filteredJobOffers[index];
                      log("Job Offer: ${jobOffer.title}");
                      final team = controller.getTeamFromJobOffer(jobOffer);
                      final employees = controller.getEmployeesFromTeam(team);
                      final hobbies = employees
                          .map((e) => controller.getHobby(e.hobbyIds.first))
                          .toList();
                      final company =
                          controller.getCompanyFromJobOffer(jobOffer);
                      final companyValues = company.valueIds
                          .take(2)
                          .map((e) => controller.getCompanyValue(e))
                          .toList();
                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(team.img),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      /// HOBBIES, TITLE, AND DESCRIPTION
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Wrap(
                                                spacing: 12.0,
                                                runSpacing: 12.0,
                                                children: [
                                                  ...hobbies
                                                      .map(
                                                        (hobby) => Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            horizontal: 24.0,
                                                            vertical: 12.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: AppColors
                                                                .greenPastel,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Text(
                                                            hobby.name,
                                                            style: AppFonts
                                                                .actionL
                                                                .copyWith(
                                                              color: AppColors
                                                                  .greenText,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                      .toList(),
                                                  ...companyValues
                                                      .map(
                                                        (hobby) => Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            horizontal: 24.0,
                                                            vertical: 12.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: AppColors
                                                                .redPastel,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Text(
                                                            hobby.name,
                                                            style: AppFonts
                                                                .actionL
                                                                .copyWith(
                                                              color: AppColors
                                                                  .redText,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                      .toList(),
                                                ]),
                                            10.0.verticalSpace,
                                            Text(
                                              jobOffer.title,
                                              style: AppFonts.h1.copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                            10.0.verticalSpace,
                                            Text(
                                              jobOffer.description,
                                              style: AppFonts.bodyL.copyWith(
                                                color: Colors.white,
                                              ),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),

                                      /// ACTIONS
                                      Column(
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                                Icons.bookmark_outline_outlined),
                                            color: Colors.white,
                                            onPressed: () {
                                              // TODO
                                            },
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                                Icons.navigate_next_outlined),
                                            color: Colors.white,
                                            onPressed: () {
                                              // TODO
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  110.0.verticalSpace,
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
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
                    onChanged: (value) {
                      controller.applyFilter(value);
                    },
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
