import 'package:flutter/material.dart';
import 'package:gestor_ingresos/utils/index.dart';

class ThemeConst {
  static ThemeConst shared = ThemeConst._();
  ThemeConst._();

  InputDecorationTheme get inputTheme => InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.shared.borderInputText, width: 5)),
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: AppColor.shared.borderFocusInputText, width: 5)),
        focusedErrorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: AppColor.shared.borderErrorFocusInputText, width: 5)),
        filled: true,
      );
}
