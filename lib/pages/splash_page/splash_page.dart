import 'package:flutter/material.dart';
import 'package:gestor_ingresos/services/extensions.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = 'Splash';
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Image.asset("assets/icon/ic_launcher.png", width: Get.size.width * .8).onHero('logo').zoom()));
  }
}
