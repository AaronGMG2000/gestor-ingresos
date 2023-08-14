// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLang {
  AppLang();

  static AppLang? _current;

  static AppLang get current {
    assert(_current != null,
        'No instance of AppLang was loaded. Try to initialize the AppLang delegate before accessing AppLang.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLang> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLang();
      AppLang._current = instance;

      return instance;
    });
  }

  static AppLang of(BuildContext context) {
    final instance = AppLang.maybeOf(context);
    assert(instance != null,
        'No instance of AppLang present in the widget tree. Did you add AppLang.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLang? maybeOf(BuildContext context) {
    return Localizations.of<AppLang>(context, AppLang);
  }

  /// `Welcome back!`
  String get loginTitle {
    return Intl.message(
      'Welcome back!',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get loginButton {
    return Intl.message(
      'Log in',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get loginEmail {
    return Intl.message(
      'Email',
      name: 'loginEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get loginPassword {
    return Intl.message(
      'Password',
      name: 'loginPassword',
      desc: '',
      args: [],
    );
  }

  /// `Repeat password`
  String get repeatPassword {
    return Intl.message(
      'Repeat password',
      name: 'repeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login error, try again later`
  String get loginError {
    return Intl.message(
      'Login error, try again later',
      name: 'loginError',
      desc: '',
      args: [],
    );
  }

  /// `Email is not valid`
  String get loginErrorEmail {
    return Intl.message(
      'Email is not valid',
      name: 'loginErrorEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password is not valid`
  String get loginErrorPassword {
    return Intl.message(
      'Password is not valid',
      name: 'loginErrorPassword',
      desc: '',
      args: [],
    );
  }

  /// `Credentials are not valid`
  String get loginErrorCredentials {
    return Intl.message(
      'Credentials are not valid',
      name: 'loginErrorCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Server error`
  String get ErrorServer {
    return Intl.message(
      'Server error',
      name: 'ErrorServer',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get signupText {
    return Intl.message(
      'Don\'t have an account?',
      name: 'signupText',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get signupTitle {
    return Intl.message(
      'Create an account',
      name: 'signupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get orText {
    return Intl.message(
      'Or',
      name: 'orText',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signupButton {
    return Intl.message(
      'Sign up',
      name: 'signupButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signupAction {
    return Intl.message(
      'Sign up',
      name: 'signupAction',
      desc: '',
      args: [],
    );
  }

  /// `Error creating account, try again later`
  String get signupError {
    return Intl.message(
      'Error creating account, try again later',
      name: 'signupError',
      desc: '',
      args: [],
    );
  }

  /// `Email is already in use`
  String get signupErrorEmail {
    return Intl.message(
      'Email is already in use',
      name: 'signupErrorEmail',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get loginText {
    return Intl.message(
      'Already have an account?',
      name: 'loginText',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get loginTextButton {
    return Intl.message(
      'Log in',
      name: 'loginTextButton',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get inputName {
    return Intl.message(
      'Name',
      name: 'inputName',
      desc: '',
      args: [],
    );
  }

  /// `Photo`
  String get inputPhoto {
    return Intl.message(
      'Photo',
      name: 'inputPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get load_text {
    return Intl.message(
      'Loading...',
      name: 'load_text',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get requiredForm {
    return Intl.message(
      'This field is required',
      name: 'requiredForm',
      desc: '',
      args: [],
    );
  }

  /// `Spanish`
  String get languageEs {
    return Intl.message(
      'Spanish',
      name: 'languageEs',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get languageEn {
    return Intl.message(
      'English',
      name: 'languageEn',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get themeDark {
    return Intl.message(
      'Dark',
      name: 'themeDark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get themeLight {
    return Intl.message(
      'Light',
      name: 'themeLight',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get themeSystem {
    return Intl.message(
      'System',
      name: 'themeSystem',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLang> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLang> load(Locale locale) => AppLang.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
