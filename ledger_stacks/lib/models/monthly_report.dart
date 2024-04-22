class MonthlyReportModel {
  final DateTime date;
  final double monthlyIncome; 
  final double monthlyExpense;
  final double monthlyBalance; 

  MonthlyReportModel({
    required this.date,
    required this.monthlyIncome,
    required this.monthlyExpense,
    required this.monthlyBalance,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date.toIso8601String(),
      'monthlyIncome': monthlyIncome,
      'monthlyExpense': monthlyExpense,
      'monthlyBalance': monthlyBalance,
    };
  }

  factory MonthlyReportModel.fromMap(Map<String, dynamic> map) {
    return MonthlyReportModel(
      date: DateTime.parse(map['date']),
      monthlyIncome: map['monthlyIncome'],
      monthlyExpense: map['monthlyExpense'],
      monthlyBalance: map['monthlyBalance'],
    );
  }
}
