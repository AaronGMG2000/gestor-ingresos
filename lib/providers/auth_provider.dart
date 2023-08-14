import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestor_ingresos/lang/generated/l10n.dart';
import 'package:gestor_ingresos/models/index.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:gestor_ingresos/services/notification_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider {
  static AuthProvider shared = AuthProvider._();
  AuthProvider._();

  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserModel?> googleLogin() async {
    NotificationService.loading();
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
      Get.back();
      return currentUser;
    } catch (e) {
      Get.back();
      await logout();
      debugPrint(e.toString());
      await NotificationService.errorDialog('Login', AppLang.of(Get.context!).loginError);
      return null;
    }
  }

  Future<UserModel?> loginWithUserAndPassword(String user, String password) async {
    NotificationService.loading();
    try {
      final credential = auth.EmailAuthProvider.credential(email: user, password: password);
      await _firebaseAuth.signInWithCredential(credential);
      Get.back();
      return currentUser;
    } catch (e) {
      Get.back();
      debugPrint(e.toString());
      await logout();
      if (e is auth.FirebaseAuthException) {
        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          await NotificationService.errorDialog('Login', AppLang.of(Get.context!).loginErrorCredentials);
          return null;
        }
      }
      await NotificationService.errorDialog('Login', AppLang.of(Get.context!).loginError);
      return null;
    }
  }

  Future<UserModel?> registerWithUserAndPassword(RegisterModel user) async {
    NotificationService.loading();
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: user.email, password: user.password);
      if (credential.user == null) {
        await logout();
        await NotificationService.errorDialog('Register', AppLang.of(Get.context!).signupError);
        Get.back();
        return null;
      }
      await _firebaseAuth.currentUser!.updateDisplayName(user.name);
      Get.back();
      return currentUser;
    } catch (e) {
      Get.back();
      debugPrint(e.toString());
      await logout();
      if (e is auth.FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          await NotificationService.errorDialog('Register', AppLang.of(Get.context!).signupErrorEmail);
          return null;
        }
      }
      await NotificationService.errorDialog('Register', AppLang.of(Get.context!).signupError);
      return null;
    }
  }

  UserModel? get currentUser {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;
    return UserModel(
      email: user.email ?? '',
      name: user.displayName ?? '',
      photoUrl: user.photoURL,
      uid: user.uid,
    );
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      debugPrint(jsonEncode(e));
    }
  }
}
