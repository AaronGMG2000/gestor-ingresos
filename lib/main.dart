import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gestor_ingresos/routes/routes.dart';
import 'package:gestor_ingresos/themes/themes.dart';
import 'package:get/get.dart';
import 'package:gestor_ingresos/controllers/auth_controller.dart';
import 'package:gestor_ingresos/lang/generated/l10n.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      runApp(const MyApp());
      Get.put(AuthController(), permanent: true);
    },
    (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        AppLang.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Get.locale,
      fallbackLocale: const Locale('es'),
      supportedLocales: AppLang.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      // theme: AppTheme.principalTheme,
    );
  }
}
