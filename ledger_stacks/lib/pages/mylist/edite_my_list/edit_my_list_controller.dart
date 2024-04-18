import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/util/database/database_service.dart';

import '../../../models/my_list.dart';

class EditMyListController extends GetxController {
  final formKey = GlobalKey<FormState>();

  late TextEditingController listNameController;
  late TextEditingController listAmountController;

  EditMyListController({required MyList selectedItem}) {
    listNameController = TextEditingController(text: selectedItem.name);
    listAmountController =
        TextEditingController(text: selectedItem.amount.toString());
  }

  @override
  void onClose() {
    listNameController.dispose();
    listAmountController.dispose();
    super.onClose();
  }

  Future<void> updateMylist() async {
    final name = listNameController.text;
    final amount = double.parse(listAmountController.text);

    final myList = MyList(
      name: name,
      amount: amount,
    );
    await LedgetStackDB.instance.updateMylist(myList);
  }
}
