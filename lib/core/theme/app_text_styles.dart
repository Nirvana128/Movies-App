import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle roboto16Medium({Color color = Colors.black}) {
    return GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }
}