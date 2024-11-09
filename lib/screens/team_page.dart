import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/data_controller.dart';
import 'package:junction2024_thrive_connect/controllers/navigation_controller.dart';
import 'package:junction2024_thrive_connect/extensions.dart';
import 'package:junction2024_thrive_connect/models.dart';
import 'package:junction2024_thrive_connect/ui.dart';

class TeamPage extends GetView<DataController> {
  TeamPage({super.key});

  final navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    final jobOffer =
        controller.jobOffers[navigationController.currentJobOfferIndex];
    final team = controller.getTeamFromJobOffer(jobOffer);
    final employees = controller.getEmployeesFromTeam(team);
    final hobbies = employees
        .expand((employee) => employee.hobbyIds)
        .map((hobbyId) => controller.getHobby(hobbyId))
        .toSet()
        .toList();
    final company = controller.getCompanyFromJobOffer(jobOffer);
    final companyValues =
        company.valueIds.map((e) => controller.getCompanyValue(e)).toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            leadingWidth: 130.0,
            leading: Padding(
              padding: 20.0.paddingOnlyLeft,
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.arrow_back, color: AppColors.greenPastel),
                label: Text("Back",
                    style: TextStyle(color: AppColors.greenPastel)),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.black,
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                child: Image.asset(
                  team.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TITLE
                    Text(
                      team.name,
                      style: AppFonts.h1.copyWith(),
                    ),
                    8.0.verticalSpace,
                    /// LANGUAGE AND LOCATION
                    Text(
                      "${jobOffer.language} • ${jobOffer.location}",
                      style: AppFonts.bodyS.copyWith(),
                    ),
                    20.0.verticalSpace,
                    /// DESCRIPTION
                    Text(team.description),
                    20.0.verticalSpace,
                    Text("Team members' hobbies",
                        style: AppFonts.h3.copyWith()
                    ),
                    10.0.verticalSpace,

                    /// HOBBIES
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: hobbies
                          .map(
                            (hobby) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 4.0,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.greenPastel,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Text(
                                hobby.name,
                                style: AppFonts.actionL.copyWith(
                                  color: AppColors.greenText,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    20.0.verticalSpace,

                    /// COMPANY VALUES
                    Text("Company values",
                        style: AppFonts.h3.copyWith()
                    ),
                    10.0.verticalSpace,
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: companyValues
                          .map(
                            (value) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 4.0,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.purplePastel,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Text(
                                value.name,
                                style: AppFonts.actionL.copyWith(
                                  color: AppColors.purpleText,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
