import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/home/home_page.dart';
import 'package:ledger_stacks/pages/login/login_page.dart';

import '../auth/auth_controller.dart';
import '../auth/user_controller.dart';

class Root extends GetWidget<AuthController> {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user.uid.isNotEmpty) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
