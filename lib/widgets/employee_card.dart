import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/data_controller.dart';
import 'package:junction2024_thrive_connect/extensions.dart';
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: GestureDetector(
        onTap: () {
          details.value = !details.value;
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                employee.img,
                width: double.infinity,
                height: 275.0,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 50),
                  child: Container(
                    padding: 20.0.paddingAll,
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
                                  style: AppFonts.h1.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                6.0.verticalSpace,
                                Text(
                                  employee.workStyle,
                                  style: AppFonts.bodyS.copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                20.0.verticalSpace,

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
