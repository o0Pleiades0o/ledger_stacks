class MyList {
  final int? id;
  final String name;
  final double amount;
  final String isIncome;
  final String type;
  final String? frequency;

  MyList({
    this.id,
    required this.name,
    required this.amount,
    required this.isIncome,
    required this.type,
    required this.frequency,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'isIncome': isIncome,
      'type': type,
      'frequency': frequency,
    };
  }

  static MyList fromMap(Map<String, dynamic> map) {
    return MyList(
      id: map['id'],
      name: map['name'],
      amount: map['amount'],
      isIncome: map['isIncome'],
      type: map['type'],
      frequency: map['frequency'],
    );
  }
}
