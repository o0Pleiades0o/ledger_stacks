class DailyReportModel {
  final DateTime date;
  final double dailyIncome;
  final double dailyExpense;
  final double dailyBalance;

  DailyReportModel({
    required this.date,
    required this.dailyIncome,
    required this.dailyExpense,
    required this.dailyBalance,
  });

  DailyReportModel copyWith({
    DateTime? date,
    double? dailyIncome,
    double? dailyExpense,
    double? dailyBalance,
  }) {
    return DailyReportModel(
      date: date ?? this.date,
      dailyIncome: dailyIncome ?? this.dailyIncome,
      dailyExpense: dailyExpense ?? this.dailyExpense,
      dailyBalance: dailyBalance ?? this.dailyBalance,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date.toIso8601String(),
      'dailyIncome': dailyIncome,
      'dailyExpense': dailyExpense,
      'dailyBalance': dailyBalance,
    };
  }

  factory DailyReportModel.fromMap(Map<String, dynamic> map) {
    return DailyReportModel(
      date: DateTime.parse(map['date']),
      dailyIncome: map['dailyIncome'],
      dailyExpense: map['dailyExpense'],
      dailyBalance: map['dailyBalance'],
    );
  }
}
