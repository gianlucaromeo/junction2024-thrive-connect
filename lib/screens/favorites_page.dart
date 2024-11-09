import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/data_controller.dart';
import 'package:junction2024_thrive_connect/extensions.dart';
import 'package:junction2024_thrive_connect/ui.dart';
import 'package:junction2024_thrive_connect/widgets/app_bottom_bar.dart';
import 'package:junction2024_thrive_connect/widgets/favorite_card.dart';

class FavoritesPage extends GetView<DataController> {
  FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: [20.0, 20.0, 20.0, 0.0].fromLTRB,
        child: SafeArea(
          child: Column(
            children: [
              /// Search bar
              TextField(
                style: AppFonts.bodyL.copyWith(
                  color: AppColors.grey,
                ),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: AppFonts.bodyL.copyWith(
                    color: AppColors.grey,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 12.0,
                  ),
                  suffixIcon: Padding(
                    padding: 24.0.paddingOnlyRight,
                    child: const Icon(Icons.search),
                  ),
                  suffixIconColor: AppColors.grey,
                  filled: true,
                  fillColor: AppColors.black,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  // controller.applyFilter(value);
                },
              ),
              20.0.verticalSpace,

              /// Favorites
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...controller.favorites.jobOfferIds.map((jobOfferId) {
                        final jobOffer = controller.getJobOffer(jobOfferId);
                        return FavoriteCard(jobOffer: jobOffer);
                      }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}
