import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestor_ingresos/controllers/index.dart';
import 'package:gestor_ingresos/lang/generated/l10n.dart';
import 'package:gestor_ingresos/pages/configuration_page/configuration_page.dart';
import 'package:gestor_ingresos/pages/login_page/login_page.dart';
import 'package:gestor_ingresos/services/index.dart';
import 'package:gestor_ingresos/utils/index.dart';
import 'package:gestor_ingresos/widgets/index.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  static const String routeName = 'SignupPage';

  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
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
                    SizedBox(height: 10),
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
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(lang.loginText),
            const Gutter(),
            TextButton(
              onPressed: () => Get.offNamed(LoginPage.routeName),
              child: Text(lang.loginTextButton),
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
    final controller = Get.find<SignupController>();
    return Form(
      key: controller.formKey,
      child: AutofillGroup(
        child: Column(
          children: [
            CustomInput(
              lang.inputName,
              onChange: (value) => controller.registerModel.name = value,
              autofillHints: const [AutofillHints.name],
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 20),
            EmailField(lang.loginEmail, onChange: (value) => controller.registerModel.email = value),
            const SizedBox(height: 20),
            PasswordField(lang.loginPassword, onChange: (value) => controller.registerModel.password = value),
            const SizedBox(height: 20),
            PasswordField(lang.repeatPassword, onChange: (value) => controller.registerModel.repeatPassword = value),
            const SizedBox(height: 20),
            CustomButton(lang.signupAction, onTap: () {
              if (controller.formKey.currentState!.validate() &&
                  controller.registerModel.password == controller.registerModel.repeatPassword) {
                Get.find<AuthController>().register(controller.registerModel);
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
        AutoSizeText(lang.signupTitle, style: AppFonts.shared.loginTitle, maxLines: 1),
      ],
    );
  }
}
