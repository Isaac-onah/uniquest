import 'package:flutter/material.dart';

Color backgroundColor1 = const Color(0xffE9EAF7);
Color backgroundColor2 = const Color(0xffF4EEF2);
Color backgroundColor3 = const Color(0xffEBEBF2);
Color backgroundColor4 = const Color(0xffE3EDF5);

class TColors{
  TColors._();

  //App Basic Colors
  static const Color primary = Color(0xff001434);
  static const Color inprimary = Color(0xffFD6B68);
  static const Color subprimary = Color(0xffD897FD);

  static const Color secondary = Color(0xff353047);

  static const Color accent = Color (0xFFb0c7ff);

  static const textColor1 = Color(0xff353047);

  static const Color textColor2 = Color(0xff6F6B7A);

  static const  Color inputBorder = Color(0xff6F6B7A);

  static const Color buttonColor = Color(0xffFD6B68);

  //Gradient Colors

  static const Gradient linerGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707,-0.707),
      colors: [
      Color(0xffff9a9e),
      Color(0xfffad0c4),
    Color(0xfffad0c4),
      ]
  ); // LinearGradient

// Text Colors

  static const Color textPrimary = Color (0xFF333333);

  static const Color textSecondary = Color (0xFF6C757D);

  static const Color textWhite = Colors.white;

// Background Colors

  static const Color light = Color (0xFFF6F6F6);

  static const Color dark = Color (0xFF272727);

  static const Color primaryBackground = Color (0xFFF3F5FF);

  // Background Container Colors I

  static const Color lightContainer = Color (0xFFF6F6F6);

  static Color darkContainer = TColors.white.withOpacity(0.1);

// Button Colors

  static const Color buttonPrimary = Color (0xFFF15025);

  static const Color buttonSecondary = Color (0xFF6C757D);

  static const Color buttonDisabled = Color (0xFFC4C4C4);

// Border Colors

  static const Color borderPrimary = Color (0xFFD9D9D9);

  static const Color borderSecondary = Color (0xFFE6E6E6);

// Error and Validation Colors

  static const Color error = Color (0xFFD32F2F);

  static const Color success = Color (0xFF388E3C);

  static const Color warning = Color (0xFFF57000);

  static const Color info = Color (0xFF1976D2);
  // Neutral Shades

  static const Color black = Color (0xFF232323);

  static const Color darkerGrey = Color (0xFF4F4F4F);

  static const Color darkGrey = Color(0xFF939393);

  static const Color grey = Color (0xFFD4D4D4);

  static const Color softGrey = Color (0xFFF4F4F4);

  static const Color lightGrey = Color (0xFFF9F9F9);

  static const Color white = Color (0xFFFFFFFF);
}
