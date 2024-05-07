import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gauge_chart/gauge_chart.dart';
import 'package:ledger_stacks/constants/color.dart';

class PercentChart extends StatelessWidget {
  const PercentChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60.h),
      child: Column(
        children: [
          Center(
            child: GaugeChart(
              children: [
                PieData(
                  value: 10,
                  color: kViolet,
                  description: "Taken",
                ),
                PieData(
                  value: 4,
                  color: kYellow,
                  description: "Planned",
                ),
              ],
              //gap: 3.5,
              animateDuration: const Duration(seconds: 1),
              start: 180,
              displayIndex: 0,
              shouldAnimate: true,
              animateFromEnd: false,
              isHalfChart: true,
              size: 200,
              showValue: false,
              borderWidth: 35,
            ),
          ),
        ],
      ),
    );
  }
}
