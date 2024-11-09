import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/data_controller.dart';
import 'package:junction2024_thrive_connect/controllers/navigation_controller.dart';
import 'package:junction2024_thrive_connect/models.dart';
import 'package:junction2024_thrive_connect/ui.dart';

// class TeamPage extends GetView<DataController> {
//   TeamPage({super.key});

//   final navigationController = Get.find<NavigationController>();
//   late final List<JobOffer> jobOffers;

//   @override
//   Widget build(BuildContext context) {
//     jobOffers =
//         controller.getJobOffersForTeam(navigationController.currentTeam);
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 300,
//               width: 300,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(30.0),
//                 child: Image.asset(
//                     controller.teams[navigationController.currentTeam].img),
//               ),
//             ),
//             Text(controller.teams[navigationController.currentTeam].name),
//             Text(jobOffers[0].description),
//             Text(jobOffers[0].location),
//             Text(jobOffers[0].language),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: 400,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset(team.img),
                ),
              ),
            ),
            Text(team.name),
            Text(team.description),
            Row(
              children: [
                Text(jobOffer.location),
                Text(jobOffer.language),
              ],
            ),
            const Text("HOBBIES"),
            Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              children: hobbies
                  .map(
                    (hobby) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.greenPastel,
                        borderRadius: BorderRadius.circular(16.0),
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
            const Text("VALUES"),
            Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              children: companyValues
                  .map(
                    (hobby) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.redPastel,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Text(
                        hobby.name,
                        style: AppFonts.actionL.copyWith(
                          color: AppColors.redText,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
