import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/color.dart';

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          //show Stat percent
          Container(
            height: 135.h,
            width: Get.width,
            decoration: BoxDecoration(
                color: kDarkgray, borderRadius: BorderRadius.circular(18.r)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              children: [
                Column(
                  children: [
                    //show income
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Container(
                        height: 100.h,
                        width: 170.w,
                        decoration: BoxDecoration(
                            color: kDarkgray,
                            borderRadius: BorderRadius.circular(18.r)),
                      ),
                    ),
                    //show Expenses
                    Padding(
                      padding: EdgeInsets.only(right: 10.w, top: 10.h),
                      child: Container(
                        height: 100.h,
                        width: 170.w,
                        decoration: BoxDecoration(
                            color: kDarkgray,
                            borderRadius: BorderRadius.circular(18.r)),
                      ),
                    ),
                  ],
                ),
                //show percent left
                Container(
                  height: 215.h,
                  width: 145.w,
                  decoration: BoxDecoration(
                      color: kDarkgray,
                      borderRadius: BorderRadius.circular(18.r)),
                ),
              ],
            ),
          ),
          //show Graph
          Container(
            height: 125.h,
            width: Get.width,
            decoration: BoxDecoration(
                color: kDarkgray, borderRadius: BorderRadius.circular(18.r)),
          ),
          // ButtonRaL(
          //     buttonText: "Sign out",
          //     onPressed: () {
          //       authController.signOut();
          //       Get.offAll(() => const LoginPage());
          //     }),
        ],
      ),
    );
  }
}
