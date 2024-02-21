import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:strihkod/app/data/auth_service_dart_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../routes/app_pages.dart';

import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final service = AuthServiceDartProvider();

  final _isLogin = true.obs;

  String get loginText => _isLogin.value ? "Вход" : "Регистрация";
  String get alternativeText =>
      _isLogin.value ? "Нет аккаунта?" : "Уже есть аккаунт?";

  Future<void> auth() async {
    if (_isLogin.value == true) {
      var res = await service.signIn(emailController.text, passController.text);
      if (res is User) {Get.toNamed(Routes.HOME);}
      print(res);
    } else {
      var res = await service.signUp(emailController.text, passController.text);
      if (res is User) {changeAuthType();}
      print(res);
    }
    Get.toNamed(Routes.BARCODE_SCANNER);
  } // TODO

  Future<void> changeAuthType() async => _isLogin.value = !_isLogin.value;
}
