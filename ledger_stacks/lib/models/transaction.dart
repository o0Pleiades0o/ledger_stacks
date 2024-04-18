class TransactionModel {
  final int? id;
  final String name;
  final double amount;
  final String isIncome;
  final DateTime? date;

  TransactionModel({
    this.id,
    required this.name,
    required this.amount,
    required this.isIncome,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'isIncome': isIncome,
      'date': date?.millisecondsSinceEpoch, // หรือใช้ date?.toIso8601String() ตามความเหมาะสม
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      name: map['name'],
      amount: map['amount'],
      isIncome: map['isIncome'],
      date: map['date'],
    );
  }
}
