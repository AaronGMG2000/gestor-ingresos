import 'package:flutter/material.dart';
import 'package:gestor_ingresos/models/index.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RegisterModel registerModel = RegisterModel();

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  Future<void> _init() async {}
}
