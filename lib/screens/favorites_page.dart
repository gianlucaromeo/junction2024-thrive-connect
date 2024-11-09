import 'package:flutter/material.dart';
import 'package:junction2024_thrive_connect/ui.dart';
import 'package:junction2024_thrive_connect/widgets/app_bottom_bar.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Favorites",),
      ),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}
