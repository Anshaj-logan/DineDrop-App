import 'package:dinedrop_app/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void showCustomSnackbar(String message,
    {bool isError = true, String title = "Error"}) {
  Get.snackbar(title, message,
      titleText: BigText(text: title, color: Colors.white),
      messageText: Text(
        message,
        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16),
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.redAccent);
}
