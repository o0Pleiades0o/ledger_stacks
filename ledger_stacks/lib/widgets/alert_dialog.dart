import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/auth_controller.dart';
import '../pages/login/login_page.dart';

Future<void> showMyDialog(BuildContext context) async {
  final authController = Get.find<AuthController>();

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Sign out?'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Did you want to sign out?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              authController.signOut();
              Get.offAll(() => const LoginPage());
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
