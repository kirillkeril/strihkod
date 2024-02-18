import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:strihkod/shared/enums/errors.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          AuthError.userAlreadyExists.message,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
