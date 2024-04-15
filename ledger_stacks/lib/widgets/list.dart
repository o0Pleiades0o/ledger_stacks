import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Listdata extends StatelessWidget {
  const Listdata({super.key}); // Fixed super constructor call

  @override
  Widget build(BuildContext context) {
    final List<String> items = ['ค่ารถ', 'ค่าอาหาร', 'ค่าไปเรียน'];
    final List<String> amount = [
      '90',
      '50',
      '11200'
    ]; // Added explicit type <String>

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: Container(
            height: 35.h,
            width: Get.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Row(
                children: [
                  Text(
                    items[index],
                  ),
                  const Spacer(),
                  Text(
                    amount[index],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
