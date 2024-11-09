import 'package:flutter/material.dart';
import 'package:junction2024_thrive_connect/widgets/app_bottom_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Profile"),
      ),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}
