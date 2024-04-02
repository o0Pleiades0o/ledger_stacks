import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/auth/auth_controller.dart';
import 'package:ledger_stacks/auth/user_controller.dart';
import 'package:ledger_stacks/pages/home/home_page.dart';
import 'package:ledger_stacks/pages/login/login_page.dart';

class Root extends GetWidget<AuthController> {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        final authController = Get.find<AuthController>();
        final isUserLoggedIn = authController.firebaseUser.value != null &&
            authController.user.isNotEmpty == true;

        return isUserLoggedIn ? const HomePage() : const LoginPage();
      },
    );
  }
}
