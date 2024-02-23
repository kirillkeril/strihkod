import 'package:get/get.dart';
import 'package:strihkod/app/data/auth_service_dart_provider.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthServiceDartProvider>(
      () => AuthServiceDartProvider(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
