import 'package:get/get.dart';
import 'package:ledger_stacks/models/my_list.dart';
import 'package:ledger_stacks/util/database/database_service.dart';

class MyListController extends GetxController {
  final myLists = <MyList>[].obs;
  final selectedItems = <MyList>[].obs;
  var isMultiSelect = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMyLists();
  }

  void toggleSelection(MyList item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
  }

  void deleteSelectedItems() {
    for (var item in selectedItems) {
      LedgetStackDB.instance.deleteMyList(item.id!, this);
    }
    selectedItems.clear();
  }

  Future<void> fetchMyLists() async {
    final lists = await LedgetStackDB.instance.getMylist();
    myLists.assignAll(lists);
  }

  // Method to update the list data
  void updateList() async {
    final lists = await LedgetStackDB.instance.getMylist();
    myLists.assignAll(lists);
  }
}
