import 'package:flutter/material.dart';
import 'package:gestor_ingresos/models/login_model.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginModel loginModel = LoginModel();
}
