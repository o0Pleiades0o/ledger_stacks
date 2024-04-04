import 'package:get/get.dart';
import 'package:ledger_stacks/auth/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<AuthController>(AuthController(), permanent: true);
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
  }
}
