import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junction2024_thrive_connect/controllers/navigation_controller.dart';
import 'package:junction2024_thrive_connect/extensions.dart';
import 'package:junction2024_thrive_connect/ui.dart';

class AppForm extends GetView<NavigationController> {
  const AppForm({
    super.key,
  });

  // final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Answer input
          TextFormField(
            // focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: 'Type your answer here',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  width: 1.0,
                  color: AppColors.neutralLightDarkest,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  width: 1.0,
                  color: AppColors.highlightsDarkest,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  width: 1.0,
                  color: AppColors.error,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  width: 1.0,
                  color: AppColors.error,
                ),
              ),
            ),
            style: AppFonts.bodyM,
            validator: (value) {
              //
            },
            onFieldSubmitted: (value) {
              //
              // _focusNode.requestFocus();
            },
          ),
          16.0.verticalSpace,
        ],
      ),
    );
  }
}
