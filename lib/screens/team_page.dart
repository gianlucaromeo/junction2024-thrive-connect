import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/data_controller.dart';
import 'package:junction2024_thrive_connect/controllers/navigation_controller.dart';
import 'package:junction2024_thrive_connect/models.dart';

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
        controller.getJobOffersForTeam(navigationController.currentTeam);

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
                  child: Image.asset(
                      controller.teams[navigationController.currentTeam].img),
                ),
              ),
            ),
            Text(controller.teams[navigationController.currentTeam].name),
            Text(
                controller.teams[navigationController.currentTeam].description),
            Row(
              children: [
                Text(jobOffer.location),
                Text(jobOffer.language),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
