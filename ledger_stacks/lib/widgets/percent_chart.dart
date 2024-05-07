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
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(180 / 360),
              child: SizedBox(
                height: 200,
                width: 200,
                child: OverflowBox(
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
                    shouldAnimate: false,
                    isHalfChart: true,
                    size: 200,
                    showValue: false,
                    borderWidth: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
