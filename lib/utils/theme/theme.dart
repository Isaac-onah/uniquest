import 'package:flutter/material.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/theme/custom_themes/appbar_theme.dart';
import 'package:uniquest/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:uniquest/utils/theme/custom_themes/chip_theme.dart';
import 'package:uniquest/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:uniquest/utils/theme/custom_themes/outline_button_theme.dart';
import 'package:uniquest/utils/theme/custom_themes/text_field_theme.dart';
import 'package:uniquest/utils/theme/custom_themes/text_theme.dart';

class TAppTheme{
  TAppTheme._();

  ///controlls the light theme
  static ThemeData lightTheme= ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    scaffoldBackgroundColor:backgroundColor1,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    textSelectionTheme: TTextFormFieldTheme.TextSelectionTheme,
  );

  ///controlls the darktheme
  static ThemeData darkTheme= ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: TColors.primary,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    textSelectionTheme: TTextFormFieldTheme.TextSelectionTheme,
  );
}