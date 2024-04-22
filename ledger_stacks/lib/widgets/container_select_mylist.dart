import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/mylist/mylist_controller.dart';

class ContainerSelectMylist extends StatelessWidget {
  ContainerSelectMylist({
    super.key,
  });

  final MyListController myListController = Get.put(MyListController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      debugPrint("Pressed");
                    },
                    icon: const Icon(
                      FontAwesomeIcons.angleLeft,
                      color: Colors.grey,
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    "Daily list",
                    style: TextStyle(color: Colors.grey, fontSize: 20.sp),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      debugPrint("Pressed");
                    },
                    icon: const Icon(
                      FontAwesomeIcons.angleRight,
                      color: Colors.grey,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
