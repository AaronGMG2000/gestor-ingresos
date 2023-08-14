import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestor_ingresos/controllers/auth_controller.dart';
import 'package:gestor_ingresos/pages/home_page/pages/index.dart';
import 'package:gestor_ingresos/services/extensions.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _Background(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: const Column(
                  children: [
                    _Header(),
                    ResumeActions(),
                  ],
                ).inScroll),
                const ExpensesPage(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/img/background.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
          color: Colors.black.withOpacity(0.3),
          height: double.infinity,
          width: double.infinity,
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Obx(
        () => Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(controller.user.value?.photoUrl ?? 'assets/img/profile.png'),
            ).onHero('profile'),
            const Gutter(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    controller.user.value?.name ?? '',
                    maxLines: 1,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  AutoSizeText(
                    controller.user.value?.email ?? '',
                    style: const TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => Get.toNamed('ConfigurationPage'),
              icon: const Icon(Icons.settings),
              color: Colors.white,
            ).onHero('settings'),
          ],
        ),
      ),
    );
  }
}
