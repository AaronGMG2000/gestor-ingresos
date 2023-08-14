import 'package:gestor_ingresos/lang/generated/l10n.dart';
import 'package:gestor_ingresos/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationService {
  static showSnackbar(
    String message, {
    int milliseconds = 1500,
    Color? color,
    Color textColor = Colors.white,
    double size = 14,
  }) {
    final snackBar = GetSnackBar(
      backgroundColor: color ?? const Color(0xFF303030),
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: AppFonts.shared.snackBarFont(textColor, size),
      ),
      duration: Duration(milliseconds: milliseconds),
    );
    Get.showSnackbar(snackBar);
  }

  static Future<void> errorDialog(String title, String message) async {
    final alert = AlertDialog(
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text(title, style: AppFonts.shared.errorDialogTitle),
            const SizedBox(height: 10),
            Text(message, style: AppFonts.shared.errorDialogMessage)
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('ACEPTAR', style: AppFonts.shared.errorDialogButton),
          onPressed: () => Get.back(),
        ),
      ],
    );
    await Get.dialog(alert, barrierDismissible: true);
  }

  static optionDialog(String title, String message, {VoidCallback? close, VoidCallback? accept}) {
    final alert = AlertDialog(
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text(title, style: AppFonts.shared.errorDialogTitle),
            const SizedBox(height: 10),
            Text(message, style: AppFonts.shared.errorDialogMessage)
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('CANCELAR', style: AppFonts.shared.errorDialogButton),
          onPressed: () {
            Get.back();
            if (close != null) close();
          },
        ),
        TextButton(
          child: Text('ACEPTAR', style: AppFonts.shared.errorDialogButton),
          onPressed: () {
            Get.back();
            if (accept != null) accept();
          },
        ),
      ],
    );
    Get.dialog(alert, barrierDismissible: true);
  }

  static menuDialog(String title, Widget child, {double height = 300}) {
    final modal = Center(
      child: SizedBox(
        width: Get.width * .9,
        height: height,
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: Padding(padding: const EdgeInsets.all(20), child: child),
        ),
      ),
    );
    Get.generalDialog(pageBuilder: ((_, __, ___) => modal), barrierDismissible: false, barrierLabel: 'modal');
  }

  static loading({String? text}) {
    final bodyProgress = Stack(
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Container(
            decoration: BoxDecoration(color: AppColor.shared.iconColor, borderRadius: BorderRadius.circular(10.0)),
            width: 300.0,
            height: 150.0,
            alignment: AlignmentDirectional.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: CircularProgressIndicator(backgroundColor: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: Center(
                    child: Text(
                      text ?? AppLang.of(Get.context!).load_text,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
    final child = WillPopScope(
      onWillPop: () async => false,
      child: SimpleDialog(backgroundColor: Colors.transparent, children: [Center(child: bodyProgress)]),
    );
    Get.dialog(child, barrierDismissible: false);
  }
}
