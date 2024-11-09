import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/data_controller.dart';
import 'package:junction2024_thrive_connect/controllers/navigation_controller.dart';
import 'package:junction2024_thrive_connect/screens/favorites_page.dart';
import 'package:junction2024_thrive_connect/screens/reels_page.dart';
import 'package:junction2024_thrive_connect/screens/profile_page.dart';
import 'package:junction2024_thrive_connect/screens/team_page.dart';
import 'package:junction2024_thrive_connect/ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(NavigationController());
  Get.put(DataController());

  await Get.find<DataController>().loadData();

  setSystemUIOverlayColor(AppColors.white);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Thrive Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        textTheme: AppFonts.textTheme,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.purplePastel,
          selectionColor: AppColors.purplePastel,
          selectionHandleColor: AppColors.purplePastel,
        ),
      ),
      getPages: [
        GetPage(
          name: '/favorites',
          page: () => FavoritesPage(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/reels',
          page: () => ReelsPage(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/profile',
          page: () => ProfilePage(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/team',
          page: () => const TeamPage(),
          transition: Transition.rightToLeftWithFade,
        ),
      ],
      initialRoute: '/favorites',
    );
  }
}
