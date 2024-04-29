import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/models/transaction.dart';
import 'package:ledger_stacks/pages/myledger/show_ledger/ledger_list_controller.dart';
import 'package:ledger_stacks/util/database/database_service.dart';

class EditLedgerController extends GetxController {
  final formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController amountController;
  late final LedgerListController? ledgerListController;
  late final TransactionModel selectedItem;

  EditLedgerController({
    required this.selectedItem,
    this.ledgerListController,
  }) {
    nameController = TextEditingController(text: selectedItem.name);
    amountController =
        TextEditingController(text: selectedItem.amount.toString());
  }

  @override
  void onClose() {
    nameController.dispose();
    amountController.dispose();
    super.onClose();
  }

  Future<void> updateMylist() async {
    final name = nameController.text;
    final amount = double.parse(amountController.text);

    final transaction = TransactionModel(
      id: selectedItem.id,
      name: name,
      amount: amount,
      isIncome: selectedItem.isIncome,
    );
    await LedgetStackDB.instance.updateTransaction(transaction);
    // await LedgetStackDB.instance.updateTransaction(transaction, ledgerListController!);
  }
}