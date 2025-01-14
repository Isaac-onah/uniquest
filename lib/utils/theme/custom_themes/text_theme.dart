import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniquest/utils/constants/color.dart';

class TTextTheme {
  TTextTheme._();

  ///controlls the lightTexttheme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
        textStyle: const TextStyle().copyWith(
            fontSize: 32.0, fontWeight: FontWeight.bold, color: TColors.textColor1)),
    headlineMedium: GoogleFonts.poppins(
        textStyle: TextStyle().copyWith(
            fontSize: 24.0, fontWeight: FontWeight.w600, color: TColors.textColor1)),
    headlineSmall: GoogleFonts.poppins(
        textStyle: const TextStyle().copyWith(
            fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.textColor1)),
    titleLarge: GoogleFonts.poppins(
        textStyle: const TextStyle().copyWith(
            fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.textColor1)),
    titleMedium: GoogleFonts.poppins(
        textStyle: const TextStyle().copyWith(
            fontSize: 16.0, fontWeight: FontWeight.w500, color: TColors.textColor2)),
    titleSmall: GoogleFonts.poppins(
        textStyle: const TextStyle().copyWith(
            fontSize: 16.0, fontWeight: FontWeight.w400, color: TColors.textColor2)),
    bodyLarge: GoogleFonts.poppins(
        textStyle: const TextStyle().copyWith(
            fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.textColor2)),
    bodyMedium: GoogleFonts.poppins(
        textStyle: const TextStyle().copyWith(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: TColors.textColor2)),
    bodySmall: GoogleFonts.poppins(
        textStyle: const TextStyle().copyWith(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: TColors.textColor2.withOpacity(0.5))),
    labelLarge: GoogleFonts.poppins(
        textStyle: const TextStyle().copyWith(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: TColors.textColor2)),
    labelMedium: GoogleFonts.poppins(
        textStyle: const TextStyle().copyWith(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: TColors.textColor2.withOpacity(0.5))),
  );

  ///controlls the darkTexttheme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
  textStyle: const TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white)),
    headlineMedium: GoogleFonts.poppins(
  textStyle: const TextStyle().copyWith(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white)),
    headlineSmall: GoogleFonts.poppins(
  textStyle: const TextStyle().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white)),
    titleLarge: GoogleFonts.poppins(
  textStyle: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white)),
    titleMedium: GoogleFonts.poppins(
  textStyle: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white)),
    titleSmall: GoogleFonts.poppins(
  textStyle: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white)),
    bodyLarge: GoogleFonts.poppins(
  textStyle: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white)),
    bodyMedium: GoogleFonts.poppins(
  textStyle: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.white)),
    bodySmall: GoogleFonts.poppins(
  textStyle: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.white.withOpacity(0.5))),
    labelLarge: GoogleFonts.poppins(
  textStyle: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white)),
    labelMedium:GoogleFonts.poppins(
  textStyle:  const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.white.withOpacity(0.5))),
  );
}
