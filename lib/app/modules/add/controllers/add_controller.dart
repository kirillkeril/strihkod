import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strihkod/app/data/product_service_provider.dart';
import 'package:strihkod/app/routes/app_pages.dart';

class AddController extends GetxController {

  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final service = ProductServiceProvider();

  AddProductDto dto = AddProductDto(code: '',name: '');
  Future <void> add () async {
    dto = AddProductDto(code: codeController.text, name: nameController.text);
    var res = await service.addProduct(dto);
    Get.toNamed(Routes.HOME);
    }
  }
