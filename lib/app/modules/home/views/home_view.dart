import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:strihkod/shared/colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLogo(),
          _buildList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.add(),
        child: const Icon(Icons.add),
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
          "Список продуктов",
          style: TextStyle(
            fontSize: 34,
            color: LightColors.whiteColor,
          ),
        ),
      ),
    );
  }

  Container _buildList() {
    return Container(
      height: Get.height * 0.80,
      width: Get.width,
      decoration: BoxDecoration(
        color: LightColors.productsColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(60),
        ),
      ),
      child: Center(
        child: Obx(() => Text(
              controller.products.length.toString(),
              style: TextStyle(
                fontSize: 34,
                color: LightColors.whiteColor,
              ),
            )),
      ),
    );
  }
}
