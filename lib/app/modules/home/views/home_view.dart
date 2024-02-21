import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:strihkod/app/routes/app_pages.dart';

import 'package:strihkod/shared/colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.05),
              _buildButtons(),
              SizedBox(height: Get.height * 0.025),
            ],
          ),
        ),
      ),
    );
  }
}

  Container _buildButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: Get.width * 0.8,
      decoration: BoxDecoration(
        color: LightColors.whiteColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width * 0.7,
              height: Get.height * 0.05,
              child: TextButton(
                onPressed: () => Get.toNamed(Routes.ADD),
                child: const Text(
                  "Добавить штрих код",
                  style:  TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
    );
  }