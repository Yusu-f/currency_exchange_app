class Crypto {
  final String? name;
  final dynamic currentPrice;
  final dynamic changePct;

  const Crypto({this.name, this.currentPrice, this.changePct});

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      name: json['name'],
      currentPrice: json['currentPrice'],
      // changePct: json['data']['change_pct'],
    );
  }
}