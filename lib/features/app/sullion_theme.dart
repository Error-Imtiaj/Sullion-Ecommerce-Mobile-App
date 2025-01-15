import 'package:ecommerce_project/features/app/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SullionAppThemeData {
  static ThemeData get lightThemeData {
    return ThemeData(
      textTheme: TextTheme(
        displaySmall: GoogleFonts.montserrat(), // font size 44
        bodyLarge: GoogleFonts.montserrat(letterSpacing: 1.2), // font size 16
        bodyMedium: GoogleFonts.montserrat(), // font size 14
        titleLarge: GoogleFonts.montserrat(
            fontSize: 30, fontWeight: FontWeight.bold), // font size 30
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: SullionAppColor.primaryBlackColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: SullionAppColor.primaryBackgroundColor,
      ),
      scaffoldBackgroundColor: SullionAppColor.primaryBackgroundColor,

      //? elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: SullionAppColor.primaryBlackColor,
          elevation: 2,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))),
          fixedSize: const Size.fromWidth(double.maxFinite),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),

      //? input decoration
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.montserrat(),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        border: const OutlineInputBorder(
          //borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: SullionAppColor.primaryBlackColor),
        ),
        enabledBorder: const OutlineInputBorder(
          //borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: SullionAppColor.primaryBlackColor),
        ),
        focusedBorder: const OutlineInputBorder(
          // borderRadius: BorderRadius.circular(8),
          borderSide:
              BorderSide(color: SullionAppColor.primaryBlackColor, width: 2),
        ),
      ),
    );
  }
}
