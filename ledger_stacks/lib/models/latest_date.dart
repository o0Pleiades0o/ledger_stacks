class LatestDate {
  final String? latestdate;

  LatestDate({
    this.latestdate,
  });

  Map<String, dynamic> toMap() {
    return {
      'lastestdate': latestdate,
    };
  }

  factory LatestDate.fromMap(Map<String, dynamic> map) {
    return LatestDate(
      latestdate: map['latestdate'],
    );
  }
}
