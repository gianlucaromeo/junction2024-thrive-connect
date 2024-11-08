import 'package:flutter/material.dart';
import 'package:junction2024_thrive_connect/ui.dart';
import 'package:junction2024_thrive_connect/widgets/app_bottom_bar.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TikTokStyleFullPageScroller(
          contentSize: 10,
          builder: (context, index) {
            return Container(
              color: index % 2 == 0 ? Colors.blue : Colors.red,
              child: Center(
                child: Text(
                  index.toString(),
                  style: AppFonts.h1,
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const AppBottomBar(),
    );
  }
}
