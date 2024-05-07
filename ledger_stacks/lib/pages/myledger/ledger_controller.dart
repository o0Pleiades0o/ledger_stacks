import 'package:get/get.dart';
import 'package:ledger_stacks/models/transaction.dart';
import 'package:ledger_stacks/util/database/database_service.dart';

class LedgerController extends GetxController {
  final myledger = <TransactionModel>[].obs;
  final selectedItems = <TransactionModel>[].obs;
  var isMultiSelect = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMyLedger();
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
      LedgetStackDB.instance.deleteTransaction(item.id!, this);
    }
    selectedItems.clear();
  }

  Future<void> fetchMyLedger() async {
    final lists = await LedgetStackDB.instance.getTransactions();
    myledger.assignAll(lists);
  }
}
