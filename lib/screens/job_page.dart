import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/data_controller.dart';
import 'package:junction2024_thrive_connect/controllers/navigation_controller.dart';

class JobPage extends GetView<DataController> {
  const JobPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<NavigationController>();
    final jobOffer = controller.jobOffers[navigationController.currentJobOfferIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(jobOffer.title),
      ),
      body: Column(
        children: [
          Text(jobOffer.description),
        ],
      ),
    );
  }
}
