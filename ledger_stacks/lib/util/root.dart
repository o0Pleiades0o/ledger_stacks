import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/home/home_page.dart';
import 'package:ledger_stacks/pages/login/login_page.dart';

import '../auth/auth_controller.dart';

class Root extends GetView<AuthController> {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.islogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.user != null) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
