import 'package:flutter/material.dart';
import 'package:gestor_ingresos/controllers/auth_controller.dart';
import 'package:gestor_ingresos/lang/generated/l10n.dart';
import 'package:gestor_ingresos/providers/configuration_provider.dart';
import 'package:gestor_ingresos/services/extensions.dart';
import 'package:gestor_ingresos/widgets/index.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ConfigurationPage extends StatelessWidget {
  static const String routeName = 'ConfigurationPage';

  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();
    final lang = AppLang.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.user.value != null ? 'Perfil' : 'Configuración'),
        actions: [IconButton(onPressed: () async => await controller.logout(), icon: const Icon(Icons.logout))],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(),
              if (controller.user.value != null)
                Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  elevation: 10,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(controller.user.value?.photoUrl ?? 'assets/img/profile.png'),
                  ).onHero('profile'),
                ),
              const SizedBox(height: 25),
              if (controller.user.value != null)
                CustomInput(
                  lang.inputName,
                  controller: TextEditingController(text: controller.user.value!.name),
                  suffixIcon: Icons.edit,
                  onChange: (value) => controller.user.value!.name = value,
                  onPressed: () async => await controller.updateProfile(),
                ),
              const SizedBox(height: 25),
              DropdownButtonFormField(
                items: [
                  DropdownMenuItem(value: 'system', child: Text(lang.themeSystem)),
                  DropdownMenuItem(value: 'light', child: Text(lang.themeLight)),
                  DropdownMenuItem(value: 'dark', child: Text(lang.themeDark)),
                ],
                onChanged: (value) => ConfigurationProvider.shared.changeTheme(value ?? 'system'),
                value: GetStorage().read('theme') as String? ?? 'system',
              ),
              const SizedBox(height: 25),
              DropdownButtonFormField(
                items: [
                  DropdownMenuItem(value: 'es', child: Text(lang.languageEs)),
                  DropdownMenuItem(value: 'en', child: Text(lang.languageEn)),
                ],
                onChanged: (value) => ConfigurationProvider.shared.changeLanguage(value ?? 'es'),
                value: Get.locale?.languageCode,
              ),
            ],
          ),
        ),
      ),
    ).withUnfocus(context);
  }
}
