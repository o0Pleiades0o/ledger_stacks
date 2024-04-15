import 'dart:convert';

class TransactionModel {
  final String name;
  final int amount;
  final String transactionType;

  TransactionModel({
    required this.name,
    required this.amount,
    required this.transactionType,
  });

  TransactionModel copyWith({
    String? name,
    int? amount,
    String? transactionType,
  }) {
    return TransactionModel(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      transactionType: transactionType ?? this.transactionType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'amount': amount,
      'transactionType': transactionType,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      name: map['name'],
      amount: map['amount'],
      transactionType: map['transactionType'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionModel(name: $name, amount: $amount, transactionType: $transactionType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionModel &&
        other.name == name &&
        other.amount == amount &&
        other.transactionType == transactionType;
  }

  @override
  int get hashCode {
    return name.hashCode ^ amount.hashCode ^ transactionType.hashCode;
  }
}
