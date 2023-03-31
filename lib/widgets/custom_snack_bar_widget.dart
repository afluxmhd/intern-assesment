import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String message, {bool isError = true, String title = 'Error'}) {
  Get.snackbar(title, message,
      titleText: Text(title, style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.black54),
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: isError ? Colors.white : Color.fromARGB(255, 255, 255, 255));
}
