import 'package:get/get.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

class BarcodeController extends GetxController {
  final barcodeScanner = BarcodeScanner();

  final count = 0.obs;

  Future<void> processBarcode() async {
    final InputImage image = InputImage.fromFilePath('/assets/barcode.jpg');
    final List<Barcode> barcodes = await barcodeScanner.processImage(image);

    for (Barcode barcode in barcodes) {
      final BarcodeType type = barcode.type;
      final String? displayValue = barcode.displayValue;
      final String? rawValue = barcode.rawValue;

      print(type);
      print(displayValue);
      print(rawValue);
      barcodeScanner.close();
    }
  }

  @override
  void onInit() {
    print('init');
    super.onInit();
  }

  @override
  void onReady() {
    print('ready');
  }

  @override
  void onClose() {
    print('close');
    super.onClose();
  }

  void increment() => count.value++;
}
