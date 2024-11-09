import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/navigation_controller.dart';
import 'package:junction2024_thrive_connect/ui.dart';
import 'dart:ui';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenPastel,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Stack(
              children: [
                Center(
                  child: Image.asset('assets/images/brand/blob.gif',
                      fit: BoxFit.cover),
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 2.0, sigmaY: 2.0), // Adjust blur intensity
                    child: Container(
                      color: Colors.black.withOpacity(
                          0), // Transparent overlay for blurring only
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Foreground Content
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      SizedBox(
                        width: 300,
                        child: Text(
                          'Job Application Sent!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.clip,
                          maxLines: 3,
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          'Well done, keep up with it and find your perfect Team!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.clip,
                          maxLines: 3,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Get.find<NavigationController>().setCurrentIndex(1);
                          // Add your onPressed code here!
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          backgroundColor: AppColors.black,
                        ),
                        child: Icon(
                          Icons.arrow_right_alt,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
