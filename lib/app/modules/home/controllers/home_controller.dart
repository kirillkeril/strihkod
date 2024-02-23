import 'package:get/get.dart';
import 'package:strihkod/app/data/auth_service_dart_provider.dart';
import 'package:strihkod/app/data/product_service_provider.dart';
import 'package:strihkod/app/data/scanner_service.dart';
import 'package:strihkod/app/models/product/product.dart';
import 'package:strihkod/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final _authService = Get.find<AuthServiceDartProvider>();
  final _productService = Get.find<ProductServiceProvider>();
  final _scanService = Get.find<ScannerService>();

  final _isProcessing = false.obs;

  final _products = <Product>[].obs;

  bool get isProcessing => _isProcessing.value;
  List get products => _products;

  @override
  Future<void> onReady() async {
    super.onReady();
    _products.value = await _productService.getAllProducts() ?? [];
  }

  void add() async {
    if (_isProcessing.value) return;

    _isProcessing.value = true;

    ScanResultDto result = await _scanService.scanBarCode();

    if (result.isError) {
      Get.snackbar("Ошибка", result.msg);
      _isProcessing.value = false;
      return;
    }

    await Get.toNamed(Routes.ADD, arguments: result.msg);

    _isProcessing.value = false;
  }
}
