import 'package:ledger_stacks/models/transaction.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/util/database/database_service.dart';

class LedgerListControoler extends GetxController {
  final ledgerList = <TransactionModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchLedgerList();
  }
  Future<void> fetchLedgerList() async {
    final lists = await LedgetStackDB.instance.getTransactions();
    ledgerList.assignAll(lists);
  }
}
