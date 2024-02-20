import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:strihkod/app/data/auth_service_dart_provider.dart';
import 'package:strihkod/shared/enums/errors.dart';

class AuthController extends GetxController {
  final _authService = Get.find<AuthServiceDartProvider>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _isLogin = true.obs;

  String get loginText => _isLogin.value ? "Вход" : "Регистрация";
  String get alternativeText => _isLogin.value ? "Нет аккаунта?" : "Уже есть аккаунт?";

  Future<void> auth() async {
    print("------");
    String email = emailController.text;
    String password = passController.text;

    dynamic res = AuthError.noDataProvided;

    if (_isLogin.value) {
      dynamic res = await _authService.signIn(email, password);
    } else {
      dynamic res = await _authService.signUp(email, password);
    }

    if (res is AuthError) {
      print(res.message);
    } else {
      print(res.toString());
    }
  }

  Future<void> changeAuthType() async => _isLogin.value = !_isLogin.value;
}
