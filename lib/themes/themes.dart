import 'package:flutter/material.dart';
import 'package:gestor_ingresos/themes/theme_const.dart';
import 'package:gestor_ingresos/utils/index.dart';

class Themes {
  final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: FontFamily.century.name,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.black,
    ),
    inputDecorationTheme: ThemeConst.shared.inputTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: AppColor.shared.buttonBackground),
    ),
  );

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: FontFamily.century.name,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: ThemeConst.shared.inputTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: AppColor.shared.buttonBackgroundDark),
    ),
  );
}
