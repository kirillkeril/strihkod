import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:strihkod/app/modules/baarcode/controllers/barcode_controller.dart';

class BarcodeView extends GetView<BarcodeController> {
  const BarcodeView({Key? key}) : super(key: key);

  @override
  BarcodeController get controller => super.controller;

  void process() async {
    try {
      await controller.processBarcode();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    process();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BarcodeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
