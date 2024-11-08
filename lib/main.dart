import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/navigation_controller.dart';
import 'package:junction2024_thrive_connect/screens/page1.dart';
import 'package:junction2024_thrive_connect/screens/page1_1.dart';
import 'package:junction2024_thrive_connect/screens/page2.dart';
import 'package:junction2024_thrive_connect/screens/page3.dart';
import 'package:junction2024_thrive_connect/ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(NavigationController());

  setSystemUIOverlayColor(AppColors.neutralLightLightest);

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
          cursorColor: AppColors.highlightsDarkest,
          selectionColor: AppColors.highlightsDarkest,
          selectionHandleColor: AppColors.highlightsDarkest,
        ),
      ),
      getPages: [
        GetPage(
          name: '/learn',
          page: () => Page1(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/learn/current',
          page: () => Page1_1(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/exercises',
          page: () => Page2(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/exercises/current',
          page: () => Page3(),
          transition: Transition.noTransition,
        ),
      ],
      initialRoute: '/learn',
    );
  }
}