import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/data_controller.dart';
import 'package:junction2024_thrive_connect/models.dart';
import 'dart:ui';

import 'package:junction2024_thrive_connect/ui.dart'; // For BackdropFilter

class EmployeeCard extends GetView<DataController> {
  final Employee employee;

  final details = false.obs;

  EmployeeCard({required this.employee});

  @override
  Widget build(BuildContext context) {
    final hobbies = employee.hobbyIds
        .map((hobbyId) => controller.getHobby(hobbyId))
        .toSet()
        .toList();
    final employeeValues = employee.valueIds
        .map((valueId) => controller.getValues(valueId))
        .toSet()
        .toList();

    return Card(
      margin: EdgeInsets.all(27),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: GestureDetector(
        onTap: () {
          details.value = !details.value;
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                employee.img,
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.37),
                    ),
                    child: Obx(
                      () => details.value
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${employee.firstName} ${employee.lastName}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  employee.workStyle,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 8.0),

                                //TAGS
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
                                      employee.role,
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
                                            borderRadius:
                                                BorderRadius.circular(12.0),
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
                                  ...employeeValues
                                      .map(
                                        (value) => Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0,
                                            vertical: 4.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.purplePastel,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
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
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${employee.firstName} ${employee.lastName}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  employee.role,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
