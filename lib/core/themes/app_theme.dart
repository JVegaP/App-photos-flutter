import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omni_app_flutter/core/constants/color_constants.dart';
import 'package:omni_app_flutter/core/constants/style_constants.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
        colorScheme: const ColorScheme.light(
            background: kWhite
        ),
        appBarTheme: const AppBarTheme(
          color: kPrimary
        ),
        primaryColor: kPrimary,
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(
              color: kBlack,
              fontWeight: FontWeight.w600,
              fontSize: kDimens20
          ),
          bodyMedium: GoogleFonts.poppins(
              color: kBlack,
              fontWeight: FontWeight.w400,
              fontSize: kDimens15
          ),
          bodySmall: GoogleFonts.poppins(
              color: kBlack,
              fontWeight: FontWeight.w400,
              fontSize: kDimens12
          ),
        )
    );
  }
}