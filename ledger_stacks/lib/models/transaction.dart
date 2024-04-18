class TransactionModel {
  final int? id;
  final String name;
  final double amount;
  final String? transactionType;
  final DateTime? date;

  TransactionModel({
    this.id,
    required this.name,
    required this.amount,
    this.transactionType,
    this.date
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'transactionType': transactionType,
      'date' : date
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      name: map['name'],
      amount: map['amount'],
      transactionType: map['transactionType'],
      date: map['date']
    );
  }

  
}
