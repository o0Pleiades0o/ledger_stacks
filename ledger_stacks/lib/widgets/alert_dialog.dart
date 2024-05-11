import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/myledger/ledger_controller.dart';
import 'package:ledger_stacks/pages/mylist/mylist_controller.dart';
import '../auth/auth_controller.dart';
import '../pages/home/Home_pages_content/main_content.dart';
import '../pages/login/login_page.dart';

Future<void> showMyDialogLogout(BuildContext context) async {
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
              Text('Do you want to sign out?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              authController.signOut();
              await Get.offAll(() => const LoginPage());
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

Future<void> showMyDialogDelete(BuildContext context) async {
  final MyListController myListController = Get.put(MyListController());
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete?'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Do you want to delete?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Cancel');
              myListController.isMultiSelect.toggle();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              myListController.deleteSelectedItems();
              Navigator.pop(context);
              myListController.isMultiSelect.toggle();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

Future<void> showMyDialogDeleteTransaction(BuildContext context) async {
  final LedgerController ledgerController = Get.put(LedgerController());
  final HomePageController homePageController = Get.put(HomePageController());

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete?'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Do you want to delete?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Cancel');
              ledgerController.isMultiSelect.toggle();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ledgerController.deleteSelectedItems();
              homePageController.fetchData();
              Navigator.pop(context);
              ledgerController.isMultiSelect.toggle();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
