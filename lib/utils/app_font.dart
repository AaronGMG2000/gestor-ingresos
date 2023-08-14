import 'package:flutter/material.dart';
import 'package:gestor_ingresos/utils/index.dart';

class AppFonts {
  AppFonts._();

  static final AppFonts shared = AppFonts._();

  //Login Fonts

  TextStyle get loginTitle => TextStyle(
        fontFamily: FontFamily.century.name,
        fontSize: 32,
        fontWeight: FontWeight.w600,
      );

  TextStyle buttonFont(Color? color, double size) => TextStyle(
        fontFamily: FontFamily.century.name,
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
      );

  //notifications service

  TextStyle snackBarFont(Color color, double size) {
    return TextStyle(
      fontFamily: FontFamily.century.name,
      fontSize: size,
      color: color,
    );
  }

  TextStyle get errorDialogButton => TextStyle(
        fontFamily: FontFamily.berthold.name,
        color: AppColor.shared.primaryColor,
      );

  TextStyle get errorDialogMessage => TextStyle(
        fontFamily: FontFamily.century.name,
        color: Colors.black54,
        fontSize: 14,
      );

  TextStyle get errorDialogTitle => TextStyle(
        fontFamily: FontFamily.berthold.name,
        fontSize: 24,
      );
}

enum FontFamily {
  century('Century'),
  berthold('Berthold');

  final String name;

  const FontFamily(this.name);
}
