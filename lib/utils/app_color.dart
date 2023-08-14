import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static final AppColor shared = AppColor._();
  final primaryColor = const Color(0xff00a9b6);
  final borderInputText = const Color(0xffb8b9ba);
  final borderFocusInputText = const Color(0xff7d92ff);
  final borderErrorFocusInputText = Colors.red;

  //Background
  final background = const Color(0xffe5e5e5);
  final backgroundDark = const Color.fromARGB(255, 58, 58, 58);

  //button
  final buttonBackground = const Color(0xff303030);
  final buttonBackgroundDark = const Color(0xFF34475f);

  //notification service
  final iconColor = const Color.fromARGB(255, 5, 86, 157);
}
