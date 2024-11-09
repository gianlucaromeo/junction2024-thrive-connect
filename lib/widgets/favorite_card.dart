import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/data_controller.dart';
import 'package:junction2024_thrive_connect/extensions.dart';
import 'package:junction2024_thrive_connect/models.dart';
import 'package:junction2024_thrive_connect/ui.dart';

class FavoriteCard extends GetView<DataController> {
  const FavoriteCard({
    super.key,
    required this.jobOffer,
  });

  final JobOffer jobOffer;

  @override
  Widget build(BuildContext context) {
    final team = controller.getTeamFromJobOffer(jobOffer);
    final employees = controller.getEmployeesFromTeam(team);
    final hobbies = employees
        .expand((employee) => employee.hobbyIds)
        .map((hobbyId) => controller.getHobby(hobbyId))
        .toSet()
        .take(1)
        .toList();
    final company = controller.getCompanyFromJobOffer(jobOffer);
    final companyValues = company.valueIds
        .map((e) => controller.getCompanyValue(e))
        .take(1)
        .toList();

    return Container(
      margin: 20.0.paddingOnlyBottom,
      padding: 20.0.paddingAll,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(24.0),
        image: DecorationImage(
          image: AssetImage(team.img),
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE AND ICON
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                jobOffer.title,
                style: AppFonts.h2.copyWith(
                  color: AppColors.white,
                ),
              ),
              Icon(
                Icons.bookmark_outlined,
                color: AppColors.white,
              ),
            ],
          ),
          20.0.verticalSpace,

          /// VALUES, HOBBIES
          Wrap(
            spacing: 12.0,
            runSpacing: 12.0,
            children: [
              ...hobbies.map(
                (hobby) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 4.0,
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
              ),
              ...companyValues.map(
                (companyValue) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.redPastel,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Text(
                    companyValue.name,
                    style: AppFonts.actionL.copyWith(
                      color: AppColors.redText,
                    ),
                  ),
                ),
              ),
            ],
          ),
          20.0.verticalSpace,

          /// DESCRIPTION
          Text(
            jobOffer.description,
            style: AppFonts.bodyL.copyWith(
              color: AppColors.white,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
