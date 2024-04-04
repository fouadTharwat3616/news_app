import 'package:flutter/material.dart';

class AppTheme{
  static Color primaryColor=const Color(0xff39A552);
  static Color navyColor= const Color(0xff4F5A69);
  static Color lightNavy= const Color(0xff79828B);
  static Color blackColor= const Color(0xff303030);
  static Color whiteColor =Colors.white;
  static ThemeData lightTheme=ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: whiteColor
      ),
      centerTitle: true,
      shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(28),
              bottomLeft: Radius.circular(28)
          )
      )
  ),
    textTheme: TextTheme(
        bodyLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: blackColor
        ),
      bodySmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: navyColor
      ),
        bodyMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: whiteColor
        ),
      titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: navyColor
      ),
      titleSmall: const TextStyle(
        fontSize: 13,
          fontWeight: FontWeight.bold
      )
    )
  );
}