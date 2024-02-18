import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _isLogin = true.obs;

  String get loginText => _isLogin.value ? "Вход" : "Регистрация";
  String get alternativeText => _isLogin.value ? "Нет аккаунта?" : "Уже есть аккаунт?";

  Future<void> auth() async {} // TODO

  Future<void> changeAuthType() async => _isLogin.value = !_isLogin.value;
}
