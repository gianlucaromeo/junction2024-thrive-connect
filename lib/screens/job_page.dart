import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/data_controller.dart';
import 'package:junction2024_thrive_connect/controllers/navigation_controller.dart';
import 'package:junction2024_thrive_connect/extensions.dart';
import 'package:junction2024_thrive_connect/ui.dart';

class JobPage extends GetView<DataController> {
  const JobPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<NavigationController>();
    final jobOffer = controller.jobOffers[navigationController.currentJobOfferIndex];
    final company = controller.getCompanyFromJobOffer(jobOffer);
    final allCompanyEmployees = controller.getEmployeesFromCompany(company);

    return LayoutBuilder(
      builder: (context, constraints) {
        double contentWidth = constraints.maxWidth > 600 ? 375.0 : constraints.maxWidth;

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
          body: Center(
            child: Container(
              width: contentWidth,
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Employee and Well-being details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text("Employees", style: AppFonts.h2),
                            Text(allCompanyEmployees.length.toString(), style: AppFonts.bodyXL),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Well-being", style: AppFonts.h2),
                            Text("67% (89 reviews)", style: AppFonts.bodyXL),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40.0),

                    // Reviews summary card
                    SizedBox(
                      height: 200.0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            3,
                                (index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 8.0),
                                padding: const EdgeInsets.all(24.0),
                                width: contentWidth - 72.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: index.isOdd ? AppColors.purpleText : AppColors.orange,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "\"Amazing team-building activities\"",
                                      style: AppFonts.h2.copyWith(color: AppColors.white, fontSize: 20.0),
                                    ),
                                    const SizedBox(height: 14.0),
                                    Text(
                                      "At ${company.name}, we have a lot of fun together, and we believe that it's important to have a good time at work.",
                                      style: AppFonts.bodyM.copyWith(color: AppColors.white),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20.0),

                    // Job Position Card
                    Container(
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: AppColors.greyLight,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Job Position", style: AppFonts.captionM.copyWith(fontSize: 20.0)),
                          Text(jobOffer.title, style: AppFonts.h2),
                          Divider(color: AppColors.grey, thickness: 1.0, height: 48.0),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("Language", style: AppFonts.h4),
                                  const SizedBox(height: 4.0),
                                  Text(jobOffer.language, style: AppFonts.bodyM),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Team size", style: AppFonts.h4),
                                  const SizedBox(height: 4.0),
                                  Text(allCompanyEmployees.length.toString(), style: AppFonts.bodyM),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Location", style: AppFonts.h4),
                                  const SizedBox(height: 4.0),
                                  Text(jobOffer.location, style: AppFonts.bodyM),
                                ],
                              ),
                            ],
                          ),
                          Divider(color: AppColors.grey, thickness: 1.0, height: 48.0),

                          Text(jobOffer.description, style: AppFonts.bodyM),
                        ],
                      ),
                    ),
                    const SizedBox(height: 64.0),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: SizedBox(
            width: 150.0,
            child: FloatingActionButton(
              onPressed: () {
                navigationController.pushToIndex(6);
              },
              backgroundColor: AppColors.purpleText,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide.none,
              ),
              child: Text("Send application", style: AppFonts.actionL.copyWith(color: AppColors.white)),
            ),
          ),
        );
      },
    );
  }
}
