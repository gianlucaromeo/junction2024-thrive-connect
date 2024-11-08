import 'package:flutter/material.dart';
import 'package:junction2024_thrive_connect/widgets/app_bottom_bar.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Page 2"),
      ),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}
