import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:strihkod/shared/colors.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.loginColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.05),
              _buildAuthBlock(),
            ],
          ),
        ),
      ),
    );
  }
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
          const SizedBox(height: 15),
          TextField(
            controller: controller.nameController,
            decoration: const InputDecoration(
              labelText: "Название",
            ),
          ),
          const SizedBox(height: 15),
          TextButton(
              onPressed: () => controller.add(),
              child: const Text("Добавить"),
          )
        ],
      ),
    );
  }