import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtils {
  static void showLight(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  static void showDark(String title, String message) {
    print(
        'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll11111111111111111111111');
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black.withOpacity(0.8),
      colorText: Colors.white,
      snackStyle: SnackStyle.FLOATING,
    );
  }
}
