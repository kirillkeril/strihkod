import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:strihkod/app/modules/baarcode/controllers/barcode_controller.dart';

class BarcodeView extends GetView<BarcodeController> {
  const BarcodeView({Key? key}) : super(key: key);

  void process() async {
    try {
      var i = InputImage.fromFilePath('path');
      await controller.processBarcode(i);
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
