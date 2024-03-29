import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.green.shade900,
    brightness: Brightness.dark,
    cardColor: DarkColors.cardColor,
    scaffoldBackgroundColor: Colors.grey[850],
    iconTheme: const IconThemeData(color: DarkColors.textColor),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.white),
      overlayColor: MaterialStateProperty.all(Colors.green.shade100),
    )),
    appBarTheme: const AppBarTheme(
      titleSpacing: 20.0,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: DarkColors.textColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: DarkColors.textColor,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: DarkColors.cardColor),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: DarkColors.textColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: DarkColors.textColor,
      ),
      titleSmall: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: DarkColors.textColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: DarkColors.textColor,
        //height: 1.8,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: DarkColors.textColor,
        //height: 1.8,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: DarkColors.textColor,
        //height: 1.8,
      ),
    ),
    //fontFamily: 'Jannah',
  );
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.green.shade900,
    cardColor: LightColors.cardColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: LightColors.bgColor,
    iconTheme: IconThemeData(
      color: Colors.grey.shade600,
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.black54),
      overlayColor: MaterialStateProperty.all(Colors.green.shade100),
    )),
    primarySwatch: Colors.green,
    appBarTheme: const AppBarTheme(
      backgroundColor: LightColors.bgColor,
      iconTheme: IconThemeData(
        color: Colors.black54,
        size: 25,
      ),
      titleSpacing: 20.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: LightColors.textColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: LightColors.cardColor),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        //color: LightColors.textColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        //color: LightColors.textColor,
      ),
      titleSmall: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        //color: LightColors.textColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: LightColors.textColor,
        //height: 1.8,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        //color: LightColors.textColor,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        //color: LightColors.textColor,
      ),
    ),
    //fontFamily: 'Jannah',
  );
}
