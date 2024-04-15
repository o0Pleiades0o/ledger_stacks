import 'dart:convert';

class TransactionModel {
  final String name;
  final double amount;
  final String? transactionType;
  final DateTime? date;

  TransactionModel({
    required this.name,
    required this.amount,
    this.transactionType,
    this.date
  });

  TransactionModel copyWith({
    String? name,
    double? amount,
    String? transactionType,
    DateTime? date
  }) {
    return TransactionModel(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      transactionType: transactionType ?? this.transactionType,
      date: date ?? this.date
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'amount': amount,
      'transactionType': transactionType,
      'date' : date
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      name: map['name'],
      amount: map['amount'],
      transactionType: map['transactionType'],
      date: map['date']
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionModel(name: $name, amount: $amount, transactionType: $transactionType , date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionModel &&
        other.name == name &&
        other.amount == amount &&
        other.transactionType == transactionType &&
        other.date == date;
  }

  @override
  int get hashCode {
    return name.hashCode ^ amount.hashCode ^ transactionType.hashCode ^ date.hashCode;
  }
}
