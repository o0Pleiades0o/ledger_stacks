import 'package:get/get.dart';
import 'package:ledger_stacks/models/transaction.dart';
import 'package:ledger_stacks/util/database/database_service.dart';

class LedgerController extends GetxController {
  final myledger = <TransactionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMyLedger();
  }

  Future<void> fetchMyLedger() async {
    final lists = await LedgetStackDB.instance.getTransactions();
    myledger.assignAll(lists);
  }
}
