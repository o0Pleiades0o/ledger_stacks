import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/auth/auth_controller.dart';
import 'package:ledger_stacks/auth/user_controller.dart';
import 'package:ledger_stacks/pages/login/login_page.dart';
import 'package:ledger_stacks/widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    final authController = Get.find<AuthController>();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              const Text('Hello, World!'),
              const Text('This is Home Page'),
              Text(userController.user.email?.toString() ?? 'No email'),
              ButtonRaL(
                  buttonText: "Sign out",
                  onPressed: () {
                    authController.signOut();
                    Get.offAll(() => const LoginPage());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
