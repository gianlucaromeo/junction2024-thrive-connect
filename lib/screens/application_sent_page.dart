import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/navigation_controller.dart';
import 'package:junction2024_thrive_connect/extensions.dart';
import 'package:junction2024_thrive_connect/ui.dart';
import 'dart:ui';

class ApplicationSentPage extends StatelessWidget {
  const ApplicationSentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenPastel,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                // Blurred Background Image

                // Foreground Content
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          50.0.verticalSpace,
                          Text(
                            'Job Application Sent!',
                            textAlign: TextAlign.center,
                            style: AppFonts.h1.copyWith(
                              color: Colors.white,
                            ),
                            maxLines: 3,
                          ),
                          10.0.verticalSpace,
                          Text(
                            'Well done, keep up with it and find your perfect Team!',
                            textAlign: TextAlign.center,
                            style: AppFonts.bodyXL.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          40.0.verticalSpace,
                          Container(
                            padding: 30.0.paddingAll,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.white.withOpacity(0.7),
                              ),
                              borderRadius: BorderRadius.circular(200.0),
                            ),
                            child: ElevatedButton(
                                onPressed: () {
                                  Get.find<NavigationController>()
                                      .setCurrentIndex(1);
                                },
                                style: ElevatedButton.styleFrom(
                                  // shape: CircleBorder(),
                                  padding: 30.0.paddingAll,
                                  backgroundColor: AppColors.black,
                                ),
                                child: Text(
                                  "Let\'s\nswipe!",
                                  style: AppFonts.bodyXL.copyWith(
                                    color: AppColors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
