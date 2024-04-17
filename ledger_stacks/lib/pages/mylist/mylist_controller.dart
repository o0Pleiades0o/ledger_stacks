import 'package:get/get.dart';
import 'package:ledger_stacks/models/my_list.dart';
import 'package:ledger_stacks/util/database/database_service.dart';

class MyListController extends GetxController {
  final myLists = <MyList>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMyLists();
  }

  Future<void> fetchMyLists() async {
    final lists = await LedgetStackDB.instance.getMylist();
    myLists.assignAll(lists);
  }
}
