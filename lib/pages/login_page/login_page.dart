import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestor_ingresos/controllers/index.dart';
import 'package:gestor_ingresos/lang/generated/l10n.dart';
import 'package:gestor_ingresos/pages/index.dart';
import 'package:gestor_ingresos/services/index.dart';
import 'package:gestor_ingresos/utils/index.dart';
import 'package:gestor_ingresos/widgets/index.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'LoginPage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
              onPressed: () => Get.toNamed(ConfigurationPage.routeName),
              child: const Icon(Icons.settings),
            ).onHero('settings'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Column(
                  children: [
                    _Header(),
                    SizedBox(height: 20),
                    _Form(),
                    SizedBox(height: 20),
                    _Footer(),
                  ],
                ).inScroll,
              ),
            ),
          ],
        ),
      ),
    ).withUnfocus(context);
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    final lang = AppLang.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: Divider()),
            const Gutter(),
            Text(lang.orText),
            const Gutter(),
            const Expanded(child: Divider()),
          ],
        ),
        const Gutter(),
        ImageButton(url: 'assets/icon/google_icon.png', onTap: () => Get.find<AuthController>().googleLogin()),
        const Gutter(),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(lang.signupText),
            const Gutter(),
            TextButton(
              onPressed: () => Get.offNamed(SignupPage.routeName),
              child: Text(lang.signupButton),
            ),
          ],
        ),
      ],
    );
  }
}

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    final lang = AppLang.of(context);
    final controller = Get.find<LoginController>();
    return Form(
      key: controller.formKey,
      child: AutofillGroup(
        child: Column(
          children: [
            EmailField(lang.loginEmail, onChange: (value) => controller.loginModel.email = value),
            const SizedBox(height: 20),
            PasswordField(lang.loginPassword, onChange: (value) => controller.loginModel.password = value),
            const SizedBox(height: 20),
            CustomButton(lang.loginButton, onTap: () {
              if (controller.formKey.currentState!.validate()) {
                Get.find<AuthController>().login(controller.loginModel);
              }
            }),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final lang = AppLang.of(context);
    return Column(
      children: [
        Material(
          shape: const CircleBorder(),
          elevation: 5,
          child: Image.asset('assets/icon/ic_launcher.png', width: size.width * .5).onHero('logo'),
        ),
        const Gutter(),
        AutoSizeText(lang.loginTitle, style: AppFonts.shared.loginTitle, maxLines: 1),
      ],
    );
  }
}
