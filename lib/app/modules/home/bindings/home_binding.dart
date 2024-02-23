import 'package:get/get.dart';
import 'package:strihkod/app/data/list_provider.dart';
import 'package:strihkod/app/data/product_service_provider.dart';
import 'package:strihkod/app/data/scanner_service.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListService>(
      () => ListService(),
    );
    Get.lazyPut<ProductServiceProvider>(
      () => ProductServiceProvider(),
    );
    Get.lazyPut<ScannerService>(
      () => ScannerService(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
