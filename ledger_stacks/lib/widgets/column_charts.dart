import 'package:flutter/material.dart';
import 'package:ledger_stacks/constants/color.dart';
import 'package:ledger_stacks/util/database/database_service.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart extends StatelessWidget {
  const ColumnChart({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: LedgetStackDB.instance.getColumnChartData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final Map<String, double> data = snapshot.data as Map<String, double>;
          List<Map<String, dynamic>> db = [];
          data.forEach((key, value) {
            db.add({'month_year': key, 'total_amount': value});
          });
          return Container(
            margin: const EdgeInsets.all(8),
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              primaryYAxis: const NumericAxis(),
              series: <ColumnSeries>[
                ColumnSeries<Map<String, dynamic>, String>(
                  dataSource: db,
                  xValueMapper: (data, _) => data['month_year'],
                  yValueMapper: (data, _) => data['total_amount'],
                  color: kViolet,
                ),
                ColumnSeries<Map<String, dynamic>, String>(
                  dataSource: db,
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
}

class ColumnChart2 extends StatelessWidget {
  const ColumnChart2({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: LedgetStackDB.instance.getColumnChartDataIncome(),
      builder: (context, snapshotIncome) {
        if (snapshotIncome.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshotIncome.hasError) {
          return Text('Error: ${snapshotIncome.error}');
        } else {
          return FutureBuilder(
              future: LedgetStackDB.instance.getColumnChartDataExpense(),
              builder: (context, snapshotExpense) {
                if (snapshotExpense.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshotIncome.hasError) {
                  return Text('Error: ${snapshotIncome.error}');
                } else {
                  final Map<String, double> income = snapshotIncome.data as Map<String, double>;
                  List<Map<String, dynamic>> dbincome = [];
                  income.forEach((key, value) {
                    dbincome.add({'month_year': key, 'total_amount': value});
                  });
                  final Map<String, double> expense = snapshotExpense.data as Map<String, double>;
                  List<Map<String, dynamic>> dbexpense = [];
                  expense.forEach((key, value) {
                    dbexpense.add({'month_year': key, 'total_amount': value});
                  });
                  return Container(
                      margin: const EdgeInsets.all(8),
                      child: SfCartesianChart(
                        tooltipBehavior: TooltipBehavior(enable: true),
                        primaryXAxis: const CategoryAxis(),
                        primaryYAxis: const NumericAxis(
                          labelFormat: '{value}K',
                        ),
                        legend: const Legend(isVisible: true),
                        series: <ColumnSeries>[
                          ColumnSeries<Map<String, dynamic>, String>(
                            dataSource: dbincome,
                            name: 'Income',
                            xValueMapper: (data, _) => data['month_year'],
                            yValueMapper: (data, _) => data['total_amount'],
                            color: kViolet,
                          ),
                          ColumnSeries<Map<String, dynamic>, String>(
                            dataSource: dbexpense,
                            name: 'Expense',
                            xValueMapper: (data, _) => data['month_year'],
                            yValueMapper: (data, _) => data['total_amount'],
                            color: kYellow,
                          ),
                        ],
                      ));
                }
              });
        }
      },
    );
  }
}
