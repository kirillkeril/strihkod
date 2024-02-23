import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:strihkod/shared/colors.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildLogo(),
              const SizedBox(height: 35),
              _buildAddBlock(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildLogo() {
    return Container(
      height: Get.height * 0.15,
      width: Get.width,
      decoration: BoxDecoration(
        color: LightColors.bgColor,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(60),
        ),
      ),
      child: Center(
        child: Text(
          "Добавление",
          style: TextStyle(
            fontSize: 34,
            color: LightColors.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Container _buildAddBlock() {
    return Container(
      height: Get.height * 0.8,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: LightColors.productsColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [_buildBarCodeText(), const SizedBox(height: 40), _buildMainInputBlock()],
      ),
    );
  }

  Container _buildMainInputBlock() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: LightColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          TextField(
            controller: controller.nameController,
            decoration: InputDecoration(
              labelText: "Название",
              fillColor: LightColors.lightColor,
            ),
          ),
          const SizedBox(height: 15),
          OutlinedButton(
            onPressed: () => controller.add(),
            child: const Text("Добавить"),
          ),
        ],
      ),
    );
  }

  Container _buildBarCodeText() {
    return Container(
      decoration: BoxDecoration(
        color: LightColors.whiteColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        "Штрих-код товара: ${controller.barCode}",
        style: TextStyle(
          color: LightColors.bgColor,
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
