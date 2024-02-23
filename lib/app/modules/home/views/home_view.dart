import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
          bottomRight: Radius.circular(20),
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
          topLeft: Radius.circular(20),
        ),
      ),
      child: Obx(() => Center(
            child: controller.products.isEmpty
                ? Text(
                    "А ничего и нет(",
                    style: TextStyle(
                      color: LightColors.whiteColor,
                      fontSize: 28,
                    ),
                  )
                : _buildProductList(),
          )),
    );
  }

  ListView _buildProductList() {
    return ListView.builder(
      itemCount: controller.products.length,
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Slidable(
            key: Key(controller.products[index].id),
            endActionPane: ActionPane(
              extentRatio: 0.25,
              motion: const BehindMotion(),
              children: [
                SlidableAction(
                  onPressed: (BuildContext context) => controller.delete(controller.products[index].code, index),
                  backgroundColor: LightColors.redColor,
                  foregroundColor: LightColors.whiteColor,
                  icon: Icons.delete,
                  borderRadius: BorderRadius.circular(20),
                ),
              ],
            ),
            child: Card(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                leading: const Icon(Icons.photo_size_select_small_rounded),
                title: Text(controller.products[index].name),
                subtitle: Text(controller.products[index].code),
              ),
            ),
          ),
        );
      },
    );
  }
}
