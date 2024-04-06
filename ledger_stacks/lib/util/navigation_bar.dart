import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget Navigation_Bar() {
  return Container(
    height: 65.h,
    margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 20,
              spreadRadius: 10)
        ]),
  );
}
