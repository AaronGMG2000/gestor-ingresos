import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ConfigurationProvider {
  static ConfigurationProvider shared = ConfigurationProvider._();
  ConfigurationProvider._();

  Future<void> init() async {
    await GetStorage.init();
    await configureTheme();
    await configureLanguage();
  }

  Future<void> configureTheme() async {
    final box = GetStorage();
    final theme = box.read('theme');
    if (theme == null) {
      await box.write('theme', 'system');
    }
    Get.changeThemeMode(theme == 'system'
        ? ThemeMode.system
        : theme == 'light'
            ? ThemeMode.light
            : ThemeMode.dark);
  }

  Future<void> changeTheme(String theme) async {
    final box = GetStorage();
    await box.write('theme', theme);
    Get.changeThemeMode(theme == 'system'
        ? ThemeMode.system
        : theme == 'light'
            ? ThemeMode.light
            : ThemeMode.dark);
  }

  Future<void> configureLanguage() async {
    final box = GetStorage();
    final language = box.read('language');
    if (language == null) {
      await box.write('language', Get.deviceLocale?.languageCode);
    }
    Get.updateLocale(language == null ? Get.deviceLocale ?? const Locale("en") : Locale(language));
  }

  Future<void> changeLanguage(String language) async {
    final box = GetStorage();
    await box.write('language', language);
    Get.updateLocale(Locale(language));
  }
}
