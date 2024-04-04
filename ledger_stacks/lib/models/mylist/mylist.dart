class MyList {
  late String itemName;
  late double amount;
  late String listType;
  late String listFreq;

  MyList({
    required this.itemName,
    required this.amount,
    required this.listType,
    required this.listFreq,
  });

  Map<String, dynamic> toMap() {
    return {
      'itemName': itemName,
      'amount': amount,
      'listType': listType,
      'listFreq': listFreq,
    };
  }

  factory MyList.fromMap(Map<String, dynamic> map) {
    return MyList(
      itemName: map['itemName'],
      amount: map['amount'],
      listType: map['listType'],
      listFreq: map['listFreq'],
    );
  }

  @override
  String toString() {
    return 'Mylist{itemName: $itemName, amount: $amount, listType: $listType , listFreq: $listFreq}';
  }
}



