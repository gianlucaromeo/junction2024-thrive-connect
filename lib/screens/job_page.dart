import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/data_controller.dart';
import 'package:junction2024_thrive_connect/controllers/navigation_controller.dart';
import 'package:junction2024_thrive_connect/extensions.dart';
import 'package:junction2024_thrive_connect/ui.dart';

class JobPage extends GetView<DataController> {
  const JobPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<NavigationController>();
    final jobOffer =
        controller.jobOffers[navigationController.currentJobOfferIndex];
    final company = controller.getCompanyFromJobOffer(jobOffer);
    final allCompanyEmployees = controller.getEmployeesFromCompany(company);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          company.name,
          style: AppFonts.h1,
        ),
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColors.purpleText,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: 24.0.paddingAll,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// EMPLOYEES NUMBER
                Column(
                  children: [
                    Text(
                      "Employees",
                      style: AppFonts.h2,
                    ),
                    Text(
                      allCompanyEmployees.length.toString(),
                      style: AppFonts.bodyXL,
                    ),
                  ],
                ),

                /// WELL-BEIGN SCORE
                Column(
                  children: [
                    Text(
                      "Well-being",
                      style: AppFonts.h2,
                    ),
                    Text(
                      "67% (89 reviews)",
                      style: AppFonts.bodyXL,
                    ),
                  ],
                ),
              ],
            ),
            40.0.verticalSpace,

            /// Reviews summary card
            Container(
              padding: 20.0.paddingAll,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: AppColors.greenPastel,
                  width: 1.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// REVIEW QUOTE
                  Text(
                    "\"Amazing team-building activities\"",
                    style: AppFonts.h1.copyWith(
                      color: AppColors.greenText,
                    ),
                  ),
                  14.0.verticalSpace,

                  /// DESCRIPTION
                  Text(
                    "At ${company.name}, we have a lot of fun together, and we believe that it's important to have a good time at work.",
                    style: AppFonts.bodyM.copyWith(
                      color: AppColors.greenText,
                    ),
                  ),
                ],
              ),
            ),
            20.0.verticalSpace,

            /// JOB POSITION CARD
            Container(
              padding: 20.0.paddingAll,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: AppColors.grey,
                  width: 1.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// JOB POSITION
                  Text(
                    jobOffer.title,
                    style: AppFonts.h1,
                  ),
                  Divider(
                    color: AppColors.grey,
                    thickness: 1.0,
                    height: 48.0,
                  ),

                  /// LANGUAGE, TEAM SIZE, AND LOCATION
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Language",
                            style: AppFonts.h4,
                          ),
                          4.0.verticalSpace,
                          Text(
                            jobOffer.language,
                            style: AppFonts.bodyM,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Team size",
                            style: AppFonts.h4,
                          ),
                          4.0.verticalSpace,
                          Text(
                            allCompanyEmployees.length.toString(),
                            style: AppFonts.bodyM,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Location",
                            style: AppFonts.h4,
                          ),
                          4.0.verticalSpace,
                          Text(
                            jobOffer.location,
                            style: AppFonts.bodyM,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.grey,
                    thickness: 1.0,
                    height: 48.0,
                  ),

                  /// DESCRIPTION
                  Text(
                    jobOffer.description,
                    style: AppFonts.bodyM,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 150.0,
        child: FloatingActionButton(
          onPressed: () {
            // navigationController.currentJobOfferIndex++;
          },
          backgroundColor: AppColors.purpleText,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
            borderSide: BorderSide.none,
          ),
          child: Text(
            "Send application",
            style: AppFonts.actionL.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
