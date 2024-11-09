import 'package:flutter/material.dart';
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
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Image.asset(
                      'assets/images/brand/logo.png',
                      height: 100,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          'Discover your perfect Team with fitting Values!',
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
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
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
