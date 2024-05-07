import 'package:flutter/material.dart';
import 'package:gauge_chart/gauge_chart.dart';
import 'package:ledger_stacks/constants/color.dart';

class PercentChart extends StatelessWidget {
  const PercentChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            shouldAnimate: false,
            isHalfChart: true,
            size: 200,
            showValue: false,
            borderWidth: 20,
          ),
        ),
      ],
    );
  }
}
