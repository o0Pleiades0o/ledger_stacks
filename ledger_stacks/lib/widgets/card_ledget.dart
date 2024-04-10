import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/constants/color.dart';

class CardLedger extends StatelessWidget {
  const CardLedger({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //card
        Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Container(
            height: 136.h,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black87, width: 1),
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "${10 + Random().nextInt(8)}",
                        style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text(
                          "Fab.",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Income",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: kGreen,
                            ),
                          ),
                          Text(
                            '600',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: kGreen,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Expenses",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: kRed,
                            ),
                          ),
                          Text(
                            '600',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: kRed,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Balance",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: kDarkviolet),
                          ),
                          Text(
                            '600',
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: kDarkviolet),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const Listtile(),
        const Listtile(),
        const Listtile(),
        const Listtile(),
      ],
    );
  }
}

class Listtile extends StatelessWidget {
  const Listtile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: ListTile(
        title: Text(
          "List ${1 + Random().nextInt(4)}",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          "\$${1 + Random().nextInt(4) * 100}",
          style: TextStyle(fontSize: 16.sp),
        ),
      ),
    );
  }
}
