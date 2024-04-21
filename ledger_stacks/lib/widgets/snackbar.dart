import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSnackbar {
  static void show({
    String title = 'Success',
    String message = '',
    Duration duration = const Duration(seconds: 2),
    SnackPosition snackPosition = SnackPosition.BOTTOM,
    Color backgroundColor = Colors.green,
    Color textColor = Colors.white,
  }) {
    Get.snackbar(
      title,
      message,
      duration: duration,
      snackPosition: snackPosition,
      backgroundColor: backgroundColor,
      colorText: textColor,
    );
  }
}

class ErrorSnackbar {
  static void show({
    String title = 'Error',
    String message = '',
    Duration duration = const Duration(seconds: 2),
    SnackPosition snackPosition = SnackPosition.BOTTOM,
    Color backgroundColor = Colors.red,
    Color textColor = Colors.white,
  }) {
    Get.snackbar(
      title,
      message,
      duration: duration,
      snackPosition: snackPosition,
      backgroundColor: backgroundColor,
      colorText: textColor,
    );
  }
}
