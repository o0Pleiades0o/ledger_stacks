import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/color.dart';
import '../../widgets/button.dart';
import '../home/home_page.dart';

class MyLedger extends StatelessWidget {
  const MyLedger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kViolet,
            leading: KBackButton(
              onPressed: () {
                Get.off(() => const HomePage());
              },
            )),
        body: Stack(
          children: [
            Container(
                height: 170.h,
                width: Get.width,
                decoration: BoxDecoration(
                    color: kViolet,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.r),
                      bottomRight: Radius.circular(30.r),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Ledger",
                      style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ],
                )),
            //Content
            Padding(
              padding: EdgeInsets.only(top: 100.h, left: 20.w, right: 20.w),
              child: Container(
                height: 136.h,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Text(
                            "18",
                            style: TextStyle(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Fab.",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Income",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '600',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Income",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '600',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Income",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '600',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
