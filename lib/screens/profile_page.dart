import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/data_controller.dart';
import 'package:junction2024_thrive_connect/widgets/app_bottom_bar.dart';

class ProfilePage extends GetView<DataController> {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Profile"),
            Text(controller.jobSeekers[0].firstName),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}
