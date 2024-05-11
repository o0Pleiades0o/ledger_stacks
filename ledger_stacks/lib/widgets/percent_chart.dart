import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/home/Home_pages_content/main_content.dart';
import 'package:ledger_stacks/util/convert_amount.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';
import 'package:ledger_stacks/constants/color.dart';

class PercentChart extends StatelessWidget {
  const PercentChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomePageController());

    return Center(
      child: Obx(() {
        if (homeController.financialRiskChartValue.value > 1) {
          return SemicircularIndicator(
            radius: 100,
            color: kRed,
            backgroundColor: kRed,
            progress: 1,
            // Assigning the double value here
            strokeWidth: 20,
            strokeCap: StrokeCap.butt,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Text(
                    '${convertToAmount(homeController.financialRiskPercent.value)}%',
                    style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    'Financial Risk',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black26),
                  ),
                ],
              ),
            ),
          );
        } else {
          return SemicircularIndicator(
            radius: 100,
            color: kYellow,
            backgroundColor: kViolet,
            progress: homeController.financialRiskChartValue.value,
            // Assigning the double value here
            strokeWidth: 20,
            strokeCap: StrokeCap.butt,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Text(
                    '${convertToPercent(homeController.financialRiskPercent.value)}%',
                    style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    'Financial Risk',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black26),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
