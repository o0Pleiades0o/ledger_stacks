import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/util/database/database_service.dart';

import '../../../models/my_list.dart';
import '../mylist_controller.dart';

class EditMyListController extends GetxController {
  final formKey = GlobalKey<FormState>();

  late TextEditingController listNameController;
  late TextEditingController listAmountController;
  final MyListController? myListController;
  final MyList selectedItem;

  EditMyListController({
    required this.selectedItem,
    this.myListController,
  }) {
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
      id: selectedItem.id,
      name: name,
      amount: amount,
      isIncome: selectedItem.isIncome,
      type: selectedItem.type,
      frequency: selectedItem.frequency,
    );
    await LedgetStackDB.instance.updateMylist(myList, myListController!);
  }
}
