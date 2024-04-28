import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/models/transaction.dart';
import 'package:ledger_stacks/pages/myledger/ledger_controller.dart';

import '../../../util/database/database_service.dart';

class EditTransactionController extends GetxController {
  final formKey = GlobalKey<FormState>();

  late TextEditingController listNameController;
  late TextEditingController listAmountController;
  final LedgerController? ledgerController;
  final TransactionModel selectedItem;

  EditTransactionController({
    required this.selectedItem,
    this.ledgerController,
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

  Future<void> updateTransaction() async {
    final name = listNameController.text;
    final amount = double.parse(listAmountController.text);

    final transaction = TransactionModel(
      id: selectedItem.id,
      name: name,
      amount: amount,
      isIncome: selectedItem.isIncome,
      date: selectedItem.date,
    );
    await LedgetStackDB.instance
        .updateTransaction(transaction, ledgerController!);
  }
}
