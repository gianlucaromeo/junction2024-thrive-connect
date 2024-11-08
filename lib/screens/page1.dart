import 'package:flutter/material.dart';
import 'package:junction2024_thrive_connect/extensions.dart';
import 'package:junction2024_thrive_connect/widgets/app_bottom_bar.dart';
import 'package:junction2024_thrive_connect/widgets/form.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: 24.0.paddingAll,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppForm(),
            Text("Page 1 - Form"),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}
