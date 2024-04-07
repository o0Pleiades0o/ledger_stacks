import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/constants/color.dart';
import 'package:ledger_stacks/pages/myledger/ledger_page.dart';
import 'package:ledger_stacks/pages/mylist/mylist_page.dart';

Widget navigationBar() {
  return Container(
      height: 55.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(20),
                blurRadius: 20,
                spreadRadius: 10)
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //Icon go to Ledger
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.off(() => const MyLedger()),
                child: Icon(
                  FontAwesomeIcons.addressBook,
                  size: 25.sp,
                  color: kViolet,
                ),
              ),
              Text('My Ledger',
                  style: TextStyle(color: kViolet, fontSize: 10.sp)),
            ],
          ),
          Icon(
            FontAwesomeIcons.circle,
            size: 30.sp,
            color: Colors.white,
          ),
          //Icon go to MyList
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.off(() => const Mylist()),
                child: Icon(
                  FontAwesomeIcons.clipboardList,
                  size: 25.sp,
                  color: kViolet,
                ),
              ),
              Text('My List',
                  style: TextStyle(color: kViolet, fontSize: 10.sp)),
            ],
          ),
        ],
      ));
}
