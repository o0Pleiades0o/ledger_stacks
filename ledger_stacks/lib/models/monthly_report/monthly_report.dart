import 'dart:convert';

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

  MonthlyReportModel copyWith({
    DateTime? date,
    double? monthlyIncome,
    double? monthlyExpense,
    double? monthlyBalance,
  }) {
    return MonthlyReportModel(
      date: date ?? this.date,
      monthlyIncome: monthlyIncome ?? this.monthlyIncome,
      monthlyExpense: monthlyExpense ?? this.monthlyExpense,
      monthlyBalance: monthlyBalance ?? this.monthlyBalance,
    );
  }

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

  String toJson() => json.encode(toMap());

  factory MonthlyReportModel.fromJson(String source) =>
      MonthlyReportModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MonthlyReportModel(date: $date, monthlyIncome: $monthlyIncome, '
        'monthlyExpense: $monthlyExpense, monthlyBalance: $monthlyBalance)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MonthlyReportModel &&
        other.date == date &&
        other.monthlyIncome == monthlyIncome &&
        other.monthlyExpense == monthlyExpense &&
        other.monthlyBalance == monthlyBalance;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        monthlyIncome.hashCode ^
        monthlyExpense.hashCode ^
        monthlyBalance.hashCode;
  }
}
