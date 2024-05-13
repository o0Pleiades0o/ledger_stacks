import 'package:get/get.dart';

import '../../util/database/database_service.dart';

class HomePageController extends GetxController {
  final dateDay = DateTime.now();
  final monthlyIncome = 0.0.obs;
  final monthlyExpense = 0.0.obs;
  final monthlybalancePercent = 0.0.obs;
  final monthlyBalance = 0.0.obs;
  final financialRiskPercent = 0.0.obs;
  final financialRiskChartValue = 0.0.obs;
  RxList<Map<String, dynamic>> dbincomeColumn = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> dbexpenseColumn = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    fetchMonthlyIncome();
    fetchMonthlyExpense();
    fetchbalancePercent();
    fetchbalance();
    fetchfinancialRisk();
    fetchfinancialRiskChart();
    fetchColumnChartDataIncome();
    fetchColumnChartDataExpense();
  }

  void fetchMonthlyIncome() async {
    double income = await LedgetStackDB.instance.calculateMonthlyIncome(dateDay.toIso8601String());
    monthlyIncome(income);
  }

  void fetchMonthlyExpense() async {
    double expense = await LedgetStackDB.instance.calculateMonthlyExpense(dateDay.toIso8601String());
    monthlyExpense(expense);
  }

  void fetchbalancePercent() async {
    double income = await LedgetStackDB.instance.calculateMonthlyIncome(dateDay.toIso8601String());
    double expense = await LedgetStackDB.instance.calculateMonthlyExpense(dateDay.toIso8601String());
    double balancePercent = ((income - expense) / income) * 100;
    if (balancePercent.isInfinite || balancePercent.isNaN) {
      monthlybalancePercent(0.0);
    } else {
      monthlybalancePercent(balancePercent);
    }
  }

  void fetchbalance() async {
    double income = await LedgetStackDB.instance.calculateMonthlyIncome(dateDay.toIso8601String());
    double expense = await LedgetStackDB.instance.calculateMonthlyExpense(dateDay.toIso8601String());
    double balance = income - expense;
    monthlyBalance(balance);
  }

  void fetchfinancialRisk() async {
    double monthlyIncome = await LedgetStackDB.instance.calculateMonthlyIncome(dateDay.toIso8601String());
    double monthlyExpense = await LedgetStackDB.instance.calculateMonthlyExpense(dateDay.toIso8601String());
    double financialRisk = (monthlyExpense / monthlyIncome) * 100;

    if (financialRisk.isInfinite || financialRisk.isNaN || financialRisk <= 0) {
      financialRiskPercent(0.0);
    } else {
      financialRiskPercent(financialRisk);
    }
  }

  void fetchfinancialRiskChart() async {
    double monthlyIncome = await LedgetStackDB.instance.calculateMonthlyIncome(dateDay.toIso8601String());
    double monthlyExpense = await LedgetStackDB.instance.calculateMonthlyExpense(dateDay.toIso8601String());
    double financialRiskChart = (monthlyExpense / monthlyIncome);

    if (financialRiskChart.isInfinite || financialRiskChart.isNaN || financialRiskChart.isNegative) {
      financialRiskChartValue(0.0);
    } else {
      financialRiskChartValue(financialRiskChart);
    }
  }

  void fetchColumnChartDataIncome() async {
    final Map<DateTime, double> income = await LedgetStackDB.instance.getColumnChartDataIncome();
    dbincomeColumn.clear();
    List<Map<String, dynamic>> dbincome = dbincomeColumn;
    if (income.isNotEmpty) {
      income.forEach((key, value) {
        dbincome.add({'month_year': key, 'total_amount': value});
      });
    }
  }

  void fetchColumnChartDataExpense() async {
    final Map<DateTime, double> expense = await LedgetStackDB.instance.getColumnChartDataExpense();
    dbexpenseColumn.clear();
    List<Map<String, dynamic>> dbexpense = dbexpenseColumn;
    if (expense.isNotEmpty) {
      expense.forEach((key, value) {
        dbexpense.add({'month_year': key, 'total_amount': value});
      });
    }
  }
}
