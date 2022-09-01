class TimeSeries {
  String day;
  String month;
  String year;
  double epoch;
  double price;

  TimeSeries(
      {required this.day,
      required this.month,
      required this.year,
      required this.epoch,
      required this.price});

  factory TimeSeries.fromJson(Map<String, dynamic> json) {
    return TimeSeries(
      day: json['day'],
      month: json['month'],
      year: json['year'],
      epoch: json['epoch'],
      price: json['price'],
    );
  }
}
