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
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('Hello, World!'),
            const Text('This is Home Page'),
            GetX<UserController>(
              builder: (_) {
                if (_.user.email != null) {
                  return Text(_.user.email ?? 'No email available');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            ButtonRaL(
                buttonText: "Sign out",
                onPressed: () {
                  authController.signOut();
                  Get.offAll(() => const LoginPage());
                })
          ],
        ),
      ),
    );
  }
}
