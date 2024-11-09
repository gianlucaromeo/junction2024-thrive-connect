import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/navigation_controller.dart';
import 'package:junction2024_thrive_connect/extensions.dart';
import 'package:junction2024_thrive_connect/ui.dart';

class AppBottomBar extends GetView<NavigationController> {
  const AppBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.neutralDarkDarkest,
          borderRadius: BorderRadius.circular(32.0),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 12.0,
        ),
        child: BottomNavigationBar(
          currentIndex: controller.currentIndex,
          onTap: controller.setCurrentIndex,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          /// SELECTED
          selectedIconTheme: IconThemeData(color: AppColors.highlightsDarkest), // TODO Change
          selectedLabelStyle: AppFonts.actionS,
          //selectedItemColor: AppColors.neutralDarkDarkest,
          /// UNSELECTED
          unselectedIconTheme: IconThemeData(color: AppColors.neutralDarkLight),
          unselectedLabelStyle: AppFonts.bodyXS,
          //unselectedItemColor: AppColors.neutralDarkLight,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 32.0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}