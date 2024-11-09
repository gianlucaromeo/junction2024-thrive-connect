import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/data_controller.dart';
import 'package:junction2024_thrive_connect/models.dart';
import 'package:junction2024_thrive_connect/ui.dart';
import 'package:junction2024_thrive_connect/widgets/app_bottom_bar.dart';

class ProfilePage extends GetView<DataController> {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final jobSeeker = controller.jobSeekers[0];
    final hobbies = jobSeeker.hobbyIds
        .map((hobbyId) => controller.getHobby(hobbyId))
        .toSet()
        .toList();
    final jobSeekerValues = jobSeeker.valueIds
        .map((valueId) => controller.getValues(valueId))
        .toSet()
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${jobSeeker.firstName} ${jobSeeker.lastName}',
          style: AppFonts.h1,
        ),
        backgroundColor: AppColors.white,
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    jobSeeker.img,
                    width: 150.0,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  jobSeeker.role,
                  style: AppFonts.h2,
                ),
                SizedBox(height: 16.0),
                Text(
                  jobSeeker.workStyle,
                  style: AppFonts.bodyL,
                ),
                SizedBox(height: 40.0),
                Divider(
                  color: AppColors.grey,
                  thickness: 1.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // First Column with "RESUME" and image/download elements
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "RESUME",
                              style: AppFonts.h2,
                            ),
                            SizedBox(
                                height:
                                    8.0), // Spacing between text and image section
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/brand/CV.png",
                                  width: 70,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 4.0),
                                // Space between image and download text
                                Text("download", style: AppFonts.bodyS),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 16.0),
                        // Space between the two main columns
                        // Second Column with "SUMMARY" and description container
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "SUMMARY",
                              style: AppFonts.h2,
                            ),
                            SizedBox(height: 8.0),
                            // Spacing between text and description container
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.greyLight,
                                border: Border(
                                  left: BorderSide(
                                    color: AppColors.purpleText,
                                    width: 5.0,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              padding: EdgeInsets.all(8.0),
                              width: 180, // Adjust width as needed
                              child: Text(
                                "3+ years in Software Engineering studied Computer Science at Aalto University (Finland).",
                                style: AppFonts.bodyS,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Wrap(spacing: 8.0, runSpacing: 8.0, children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.redPastel,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          jobSeeker.role,
                          style: AppFonts.actionL.copyWith(
                            color: AppColors.redText,
                          ),
                        ),
                      ),
                      ...hobbies
                          .map(
                            (value) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 4.0,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.greenPastel,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Text(
                                value.name,
                                style: AppFonts.actionL.copyWith(
                                  color: AppColors.greenText,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      ...jobSeekerValues
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
                    ]),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomBar(),
    );
  }
}
