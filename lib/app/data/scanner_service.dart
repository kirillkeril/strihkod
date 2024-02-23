import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class ScannerService extends GetxService {
  Future<ScanResultDto> scanBarCode() async {
    try {
      String barcodeRes = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Отмена", false, ScanMode.BARCODE);
      return ScanResultDto(isError: false, msg: barcodeRes);
    } on PlatformException {
      return ScanResultDto(isError: true, msg: "msg");
    }
  }
}

class ScanResultDto {
  bool isError;
  String msg;
  ScanResultDto({
    required this.isError,
    required this.msg,
  });
}
