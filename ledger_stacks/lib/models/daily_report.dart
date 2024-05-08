class DailyReportModel {
  final int? id;
  final DateTime dateTime;
  final double dailyIncome;
  final double dailyExpense;
  final double dailyBalance;

  DailyReportModel(
      {required this.id,
      required this.dateTime,
      required this.dailyIncome,
      required this.dailyExpense,
      required this.dailyBalance});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dateTime' : dateTime,
      'dailyIncome': dailyIncome,
      'dailyExpense': dailyExpense,
      'dailyBalance': dailyBalance,
    };
  }

  static DailyReportModel fromMap(Map<String, dynamic> map) {
    return DailyReportModel(
      id: map['id'],
      dateTime: map['datetime'],
      dailyIncome: map['dailyIncome'],
      dailyExpense: map['dailyExpense'],
      dailyBalance: map['dailyBalance'],
    );
  }
}