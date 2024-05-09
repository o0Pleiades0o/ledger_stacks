import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ledger_stacks/constants/color.dart';
import 'package:ledger_stacks/util/database/database_service.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart2 extends StatelessWidget {
  const ColumnChart2({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: LedgetStackDB.instance.getColumnChartDataIncome(),
      builder: (context, snapshotIncome) {
        if (snapshotIncome.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshotIncome.hasError) {
          return Text('Income Error: ${snapshotIncome.error}');
        } else {
          final Map<DateTime, double> income = snapshotIncome.data as Map<DateTime, double>;
          List<Map<String, dynamic>> dbincome = [];
          if (income.isNotEmpty) {
            income.forEach((key, value) {
              dbincome.add({'month_year': key, 'total_amount': value});
            });
          } else {
            // If income data is empty or null, set default value
            dbincome.add({'month_year': DateTime.now(), 'total_amount': 0});
          }

          return FutureBuilder(
            future: LedgetStackDB.instance.getColumnChartDataExpense(),
            builder: (context, snapshotExpense) {
              if (snapshotExpense.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshotExpense.hasError) {
                return Text('Expense Error: ${snapshotExpense.error}');
              } else {
                final Map<DateTime, double> expense = snapshotExpense.data as Map<DateTime, double>;
                List<Map<String, dynamic>> dbexpense = [];
                if (expense.isNotEmpty) {
                  expense.forEach((key, value) {
                    dbexpense.add({'month_year': key, 'total_amount': value});
                  });
                }

                return Container(
                  margin: const EdgeInsets.all(8),
                  child: SfCartesianChart(
                    tooltipBehavior: TooltipBehavior(enable: true),
                    primaryXAxis: DateTimeCategoryAxis(
                      dateFormat: DateFormat.yMMM(),
                    ),
                    primaryYAxis: const NumericAxis(),
                    legend: const Legend(isVisible: true),
                    series: <ColumnSeries>[
                      ColumnSeries<Map<String, dynamic>, DateTime>(
                        dataSource: dbincome,
                        name: 'Income',
                        xValueMapper: (data, _) => data['month_year'],
                        yValueMapper: (data, _) => data['total_amount'],
                        color: kViolet,
                      ),
                      ColumnSeries<Map<String, dynamic>, DateTime>(
                        dataSource: dbexpense,
                        name: 'Expense',
                        xValueMapper: (data, _) => data['month_year'],
                        yValueMapper: (data, _) => data['total_amount'],
                        color: kYellow,
                      ),
                    ],
                  ),
                );
              }
            },
          );
        }
      },
    );
  }
}
