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

  // Method to update the list data
  void updateList() async {
    final lists = await LedgetStackDB.instance.getMylist();
    myLists.assignAll(lists);
  }
}

// class MyListController extends GetxController {
//   final RxList<MyList> myLists = RxList<MyList>();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchMyLists();
//   }

//   Future<void> fetchMyLists() async {
//     try {
//       final lists = await LedgetStackDB.instance.getMylist();
//       myLists.assignAll(lists);
//     } catch (e) {
//       debugPrint('Error fetching MyLists: $e');
//     }
//   }

//   // Method to update the list data
//   Future<void> updateList() async {
//     try {
//       final lists = await LedgetStackDB.instance.getMylist();
//       myLists.assignAll(lists);
//     } catch (e) {
//       debugPrint('Error updating MyLists: $e');
//     }
//   }
// }
