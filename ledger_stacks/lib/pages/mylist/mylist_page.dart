import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/mylist/mylist_controller.dart';
import 'package:ledger_stacks/constants/color.dart';

import '../../widgets/button.dart';
import '../../widgets/floating_action_button.dart';

import '../../widgets/list.dart';
import 'add_my_list/add_my_list_page.dart';
import '../home/home_page.dart';

class Mylist extends StatelessWidget {
  Mylist({super.key});

  final MyListController myListController = Get.put(MyListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGray,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kViolet,
        ),
        toolbarHeight: 75.h,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: KBackButton(
          onPressed: () {
            Get.off(() => const HomePage());
          },
        ),
        actions: [
          Obx(() {
            if (myListController.isMultiSelect.isTrue) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      myListController.deleteSelectedItems();
                      myListController.isMultiSelect.toggle();
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  IconButton(
                    onPressed: () {
                      myListController.isMultiSelect.toggle();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              );
            } else {
              return IconButton(
                onPressed: () {
                  myListController.isMultiSelect.toggle();
                },
                icon: const Icon(Icons.delete),
              );
            }
          })
        ],
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "My List",
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
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
