import 'package:ledger_stacks/models/transaction.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/util/database/database_service.dart';

class LedgerListController extends GetxController {
  final ledgerList = <TransactionModel>[].obs;
  final selectedItems = <TransactionModel>[].obs;
  var isMultiSelect = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLedgerList();
  }

  void toggleSelection(TransactionModel item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
  }

  void deleteSelectedItems() {
    for (var item in selectedItems) {
      LedgetStackDB.instance.deleteTransaction(item.id! ,this);
    }
    selectedItems.clear();
  }

  Future<void> fetchLedgerList() async {
    final lists = await LedgetStackDB.instance.getTransactions();
    ledgerList.assignAll(lists);
  }

  void updateLedger() async {
    final lists = await LedgetStackDB.instance.getTransactions();
    ledgerList.assignAll(lists);
  }
}
