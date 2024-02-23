import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strihkod/app/data/product_service_provider.dart';

class AddController extends GetxController {
  final _service = Get.find<ProductServiceProvider>();

  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  late final String _barCode;

  String get barCode => _barCode;

  @override
  void onInit() {
    _barCode = Get.arguments;
    super.onInit();
  }

  Future<void> add() async {
    AddProductDto dto = AddProductDto(code: _barCode, name: nameController.text);
    var res = await _service.addProduct(dto);
    Get.back();
  }
}
