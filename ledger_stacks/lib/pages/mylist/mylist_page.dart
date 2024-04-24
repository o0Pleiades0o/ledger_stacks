import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/mylist/mylist_controller.dart';
import 'package:ledger_stacks/constants/color.dart';

import '../../widgets/button.dart';
import '../../widgets/floating_action_button.dart';

//import '../../widgets/list.dart';
import '../../widgets/list.dart';
import 'add_my_list/add_my_list_page.dart';
import '../home/home_page.dart';

class Mylist extends GetView<MyListController> {
  Mylist({super.key});

  final MyListController myListController = Get.put(MyListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGray,
      appBar: AppBar(
        toolbarHeight: 75.h,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: KBackButton(
          onPressed: () {
            Get.off(() => const HomePage());
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "My List",
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body:
          // Obx(() => myListController.myLists.isEmpty
          //     ? Center(
          //         child: Text(
          //           "Not found list data.",
          //           style: TextStyle(color: Colors.black.withAlpha(80)),
          //         ),
          //       )
          //     : StickyGroupedListView<MyList, String>(
          //         elements: myListController.myLists,
          //         order: StickyGroupedListOrder.ASC,
          //         groupBy: (MyList myList) => myList.type.toString(),
          //         groupSeparatorBuilder: (MyList myList) =>
          //             _getGroupSeparator(myList),
          //         itemBuilder: (BuildContext context, MyList myList) =>
          //             _getItem(myList),
          //       )),
          SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildList("Auto"),
              _buildList("Daily"),
              _buildList("Temporary"),
            ],
          ),
        ),
      ),
      floatingActionButton: CreateFAB(
        onPressed: () {
          Get.off(() => AddMyList());
        },
      ),
    );
  }

  // Widget _getGroupSeparator(MyList myList) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         "${myList.type} List",
  //         style: TextStyle(
  //           fontSize: 18.sp,
  //           color: kDarkgray,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _getItem(MyList myList) {
  //   return Container(
  //     height: 35.h,
  //     width: Get.width,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(8.r),
  //     ),
  //     child: Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 20.w),
  //       child: Row(
  //         children: [
  //           Text(myList.name),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildList(String filterType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$filterType List",
          style: TextStyle(
            fontSize: 18.sp,
            color: kDarkgray,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          child: Listdata(filterType: filterType),
        ),
      ],
    );
  }
}
