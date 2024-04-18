import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/color.dart';

class SuccessSnackBar {
  final String text;

  SuccessSnackBar(this.text);

  void show() {
    Get.snackbar(
      'Success',
      'Item "$text" added successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: kLightviolet,
      colorText: Colors.white,
      duration: const Duration(seconds: 1),
    );
  }
}

class ErrorSnackBar {
  final String text;

  ErrorSnackBar(this.text);

  void show() {
    Get.snackbar(
     'Error',
      'Failed to add Item "$text"',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: kLightviolet,
      colorText: Colors.white,
      duration: const Duration(seconds: 1),
    );
  }
}