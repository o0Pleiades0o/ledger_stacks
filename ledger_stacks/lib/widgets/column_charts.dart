import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ledger_stacks/constants/color.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../pages/home/Home_pages_content/main_content.dart';

class ColumnChart2 extends StatelessWidget {
  const ColumnChart2({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomePageController());
    return Container(
        margin: const EdgeInsets.all(8),
        child: Obx(() {
          if (homeController.dbincomeColumn.isEmpty && homeController.dbexpenseColumn.isEmpty) {
            return SfCartesianChart(
              primaryXAxis: DateTimeCategoryAxis(
                dateFormat: DateFormat.yMMM(),
              ),
              primaryYAxis: const NumericAxis(),
              series: const <ColumnSeries>[],
            );
          } else {
            return SfCartesianChart(
              tooltipBehavior: TooltipBehavior(enable: true),
              primaryXAxis: DateTimeCategoryAxis(
                dateFormat: DateFormat.yMMM(),
              ),
              primaryYAxis: const NumericAxis(),
              legend: const Legend(isVisible: true),
              series: <ColumnSeries>[
                ColumnSeries<Map<String, dynamic>, DateTime>(
                  dataSource: homeController.dbincomeColumn,
                  name: 'Income',
                  xValueMapper: (data, _) => data['month_year'],
                  yValueMapper: (data, _) => data['total_amount'],
                  color: kViolet,
                ),
                ColumnSeries<Map<String, dynamic>, DateTime>(
                  dataSource: homeController.dbexpenseColumn,
                  name: 'Expense',
                  xValueMapper: (data, _) => data['month_year'],
                  yValueMapper: (data, _) => data['total_amount'],
                  color: kYellow,
                ),
              ],
            );
          }
        }));
  }
}
