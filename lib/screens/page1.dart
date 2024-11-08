import 'package:flutter/material.dart';
import 'package:junction2024_thrive_connect/widgets/app_bottom_bar.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Page 1"),
      ),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}
