import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';
import 'package:ledger_stacks/constants/color.dart';

class PercentChart extends StatelessWidget {
  const PercentChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SemicircularIndicator(
      radius: 100,
      color: kViolet,
      backgroundColor: kYellow,
      strokeWidth: 20,
      strokeCap: StrokeCap.butt,
      child: Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: Column(
          children: [
            Text(
              '75%',
              style: TextStyle(fontSize: 45.sp, fontWeight: FontWeight.w600),
            ),
            Text(
              'Financial balance',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: Colors.black26),
            ),
          ],
        ),
      ),
    ));
  }
}
