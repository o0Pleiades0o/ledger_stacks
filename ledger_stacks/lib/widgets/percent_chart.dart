import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ledger_stacks/util/convert_amount.dart';
import 'package:ledger_stacks/util/util.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';
import 'package:ledger_stacks/constants/color.dart';

class PercentChart extends StatelessWidget {
  const PercentChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dateDay = DateTime.now();
    financialRiskChart(dateDay.toIso8601String());

    return Center(
      child: FutureBuilder<double>(
        future: financialRiskChart(dateDay.toIso8601String()),
        builder: (context, chartSnapshot) {
          if (chartSnapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Or any loading indicator
          } else if (chartSnapshot.hasError) {
            return Text("Error: ${chartSnapshot.error}");
          } else {
            double chart = chartSnapshot.data ?? 0.0;
            return SemicircularIndicator(
              radius: 100,
              color: kYellow,
              backgroundColor: kViolet,
              progress: chart, // Assigning the double value here
              strokeWidth: 20,
              strokeCap: StrokeCap.butt,
              child: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Column(
                  children: [
                    FutureBuilder<double>(
                      future: financialRisk(dateDay.toIso8601String()),
                      builder: (context, riskSnapshot) {
                        if (riskSnapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator(); // Or any loading indicator
                        } else if (riskSnapshot.hasError) {
                          return Text("Error: ${riskSnapshot.error}");
                        } else {
                          double risk = riskSnapshot.data ?? 0.0;
                          return Text(
                            '${convertToPercent(risk)}%',
                            style: TextStyle(fontSize: 45.sp, fontWeight: FontWeight.w600),
                          );
                        }
                      },
                    ),
                    Text(
                      'Financial Risk',
                      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: Colors.black26),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
