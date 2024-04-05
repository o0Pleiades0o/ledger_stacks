import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/auth/auth_controller.dart';
import 'package:ledger_stacks/auth/user_controller.dart';
import 'package:ledger_stacks/pages/login/login_page.dart';
import 'package:ledger_stacks/pages/profile/edit_profile/edit_profile_page.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.off(() => const EditProflie());
                  },
                  child: CircleAvatar(
                    radius: 25.r,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Hello, ${userController.user.username}',
                    style:
                        TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
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
    );
  }
}
