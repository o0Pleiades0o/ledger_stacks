import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/constants/color.dart';
import 'package:ledger_stacks/util/database/database_service.dart';

import '../pages/mylist/edite_my_list/edite_my_list_page.dart';
import '../pages/mylist/mylist_controller.dart';

class Listdata extends StatelessWidget {
  Listdata({super.key, required this.filterType});

  final String filterType;
  final MyListController myListController = Get.put(MyListController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final filteredLists = myListController.myLists.where((listData) {
        return listData.type == filterType;
      }).toList();

      return filteredLists.isEmpty
          ? Center(
              child: Text(
                "Not Found list data.",
                style: TextStyle(color: Colors.black.withAlpha(80)),
              ),
            )
          : SizedBox(
              height: filteredLists.length * 50.0,
              child: ListView.builder(
                itemCount: filteredLists.length,
                itemBuilder: (BuildContext context, int index) {
                  final myListItem = filteredLists[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: Slidable(
                      endActionPane:
                          ActionPane(motion: const ScrollMotion(), children: [
                        SlidableAction(
                          onPressed: (_) {
                            debugPrint("Edit Pressed");
                            Get.off(() => EditMyList(selectedItem: myListItem));
                          },
                          backgroundColor: kViolet,
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                        ),
                        SlidableAction(
                          onPressed: (_) {
                            LedgetStackDB.instance
                                .deleteMyList(myListItem.id!, myListController);
                          },
                          backgroundColor: kRed.withOpacity(0.8),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                        ),
                      ]),
                      child: Container(
                        height: 35.h,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  myListItem.name,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 2.h),
                                decoration: BoxDecoration(
                                  color: myListItem.isIncome == 'income'
                                      ? kGreen
                                      : kRed,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: Text(
                                  myListItem.isIncome == 'income'
                                      ? "${myListItem.amount}"
                                      : "- ${myListItem.amount}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
    });
  }
}
