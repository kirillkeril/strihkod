import 'package:get/get.dart';
import 'package:strihkod/app/data/auth_service_dart_provider.dart';
import 'package:strihkod/app/data/list_provider.dart';
import 'package:strihkod/app/data/product_service_provider.dart';
import 'package:strihkod/app/data/scanner_service.dart';
import 'package:strihkod/app/models/product/product.dart';
import 'package:strihkod/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final _authService = Get.find<AuthServiceDartProvider>();
  final _listService = Get.find<ListService>();
  final _productService = Get.find<ProductServiceProvider>();
  final _scanService = Get.find<ScannerService>();

  final _isProcessing = false.obs;

  final _products = <Product>[].obs;

  bool get isProcessing => _isProcessing.value;
  List<Product> get products => _products;

  @override
  void onReady() {
    super.onReady();
    updateList();
  }

  void add() async {
    if (_isProcessing.value) return;

    _isProcessing.value = true;

    ScanResultDto result = await _scanService.scanBarCode();

    if (result.isError || result.msg == "-1") {
      Get.snackbar("Ошибка", result.msg);
      _isProcessing.value = false;
      return;
    }

    Product? product = await _productService.getProductByCode(result.msg);
    if (product == null) {
      await Get.toNamed(Routes.ADD, arguments: result.msg);
      await _listService.addProductToList(_authService.userInfo!.uid, result.msg);
    } else {
      if (_authService.userInfo == null) Get.offAndToNamed(Routes.AUTH);
      await _listService.addProductToList(_authService.userInfo!.uid, result.msg);
    }

    updateList();

    _isProcessing.value = false;
  }

  void delete(String code, int index) async {
    if (_authService.userInfo == null) Get.offAndToNamed(Routes.AUTH);
    await _listService.removeFromList(_authService.userInfo!.uid, code);
    updateList();
  }

  Future<void> updateList() async {
    if (_authService.userInfo == null) Get.offAndToNamed(Routes.AUTH);
    _products.value = await _listService.get(_authService.userInfo!.uid) ?? [];
  }
}
