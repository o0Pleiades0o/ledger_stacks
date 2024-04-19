import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/models/transaction.dart';

import 'package:ledger_stacks/util/database/database_service.dart';
import 'package:ledger_stacks/widgets/radio_button/radio_controller.dart';

class AddTransactionController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final amountController = TextEditingController();

  final RadioButtonController radioButtonController = Get.find();

  @override
  void onClose() {
    nameController.dispose();
    amountController.dispose();
    super.onClose();
  }
  
  Future<void> createTransaction() async {
    final name = nameController.text;
    final amount = double.parse(amountController.text);
    final isIncome =
        radioButtonController.selectedCharacter.value == SingingCharacter.income
            ? 'income'
            : 'expense';
    final date = DateTime.now().toIso8601String();

    final transaction = TransactionModel(
      name: name,
      amount: amount,
      isIncome: isIncome,
      date: date,
    );
    await LedgetStackDB.instance.createTransaction(transaction);
  }
}