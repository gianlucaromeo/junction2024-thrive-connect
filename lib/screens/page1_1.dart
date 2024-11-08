import 'package:flutter/material.dart';

class Page1_1 extends StatelessWidget {
  const Page1_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Page 1.1"),
      ),
      /// NO BOTTOM BAR
    );
  }
}
