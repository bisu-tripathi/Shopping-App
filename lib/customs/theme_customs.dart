import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'app_colors_custom.dart';

class MyAppTheme {
  //light theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: MyAppColors.primaryColor,
    scaffoldBackgroundColor: MyAppColors.scaffoldBackgroundColor,
    //AppBar
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: MyAppColors.primaryColor,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    //BottomNavigationBar
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      backgroundColor: MyAppColors.primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontSize: 14.sp,
      ),
    ),
    //splash
    splashFactory: InkRipple.splashFactory,
    highlightColor: MyAppColors.primaryColor,
    //TextButton
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: MyAppColors.primaryColor,
        shape: const BeveledRectangleBorder(
          side: BorderSide(color: MyAppColors.primaryColor, width: 0.4),
        ),
      ),
    ),
    //Input decoration for TextField and TextformField
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: MyAppColors.textFieldFillColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: MyAppColors.primaryColor,
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: MyAppColors.primaryColor,
        ),
      ),
    ),
    useMaterial3: true,
  );
}
