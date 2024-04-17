class MyList {
  late String? listId;
  late String listName;
  late int listAmount;
  late String listTranType;
  late String listListType;
  late String? listFrequency;

  MyList({
    this.listId,
    required this.listName,
    required this.listAmount,
    required this.listTranType,
    required this.listListType,
    this.listFrequency,
  });

  MyList copyWith({
    String? listId,
    String? listName,
    int? listAmount,
    String? listTranType,
    String? listListType,
    String? listFrequency,
  }) {
    return MyList(
      listId: listId ?? this.listId,
      listName: listName ?? this.listName,
      listAmount: listAmount ?? this.listAmount,
      listTranType: listTranType ?? this.listTranType,
      listListType: listListType ?? this.listListType,
      listFrequency: listFrequency ?? this.listFrequency,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'listId': listId,
      'listName': listName,
      'listAmount': listAmount,
      'listTranType': listTranType,
      'listListType': listListType,
      'listFrequency': listFrequency,
    };
  }

  factory MyList.fromMap(Map<String, dynamic> map) {
    return MyList(
      listId: map['listId'],
      listName: map['listName'],
      listAmount: map['listAmount'],
      listTranType: map['listTranType'],
      listListType: map['listListType'],
      listFrequency: map['listFrequency'],
    );
  }
}

