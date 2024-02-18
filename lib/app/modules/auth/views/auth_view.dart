import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:strihkod/shared/colors.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.loginColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildLogo(),
              SizedBox(height: Get.height * 0.05),
              _buildAuthBlock(),
              SizedBox(height: Get.height * 0.025),
              _buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: Get.width * 0.8,
      decoration: BoxDecoration(
        color: LightColors.whiteColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width * 0.7,
              height: Get.height * 0.05,
              child: OutlinedButton(
                onPressed: () => controller.auth(),
                child: Text(
                  controller.loginText,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(width: 5),
            TextButton(
              onPressed: () => controller.changeAuthType(),
              child: Text(controller.alternativeText),
            )
          ],
        ),
      ),
    );
  }

  Container _buildAuthBlock() {
    return Container(
      width: Get.width * 0.8,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: LightColors.whiteColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Obx(() => Text(
                controller.loginText,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                ),
              )),
          const SizedBox(height: 15),
          TextField(
            controller: controller.emailController,
            decoration: const InputDecoration(
              labelText: "Почта",
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: controller.passController,
            decoration: const InputDecoration(
              labelText: "Пароль",
            ),
          ),
        ],
      ),
    );
  }

  Container _buildLogo() {
    return Container(
      height: Get.height * 0.3,
      width: Get.width,
      decoration: BoxDecoration(
        color: LightColors.whiteColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
      ),
      child: const Center(
        child: Text(
          "это красивый логотип",
          style: TextStyle(fontSize: 34),
        ),
      ),
    );
  }
}
