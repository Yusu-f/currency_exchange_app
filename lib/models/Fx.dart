class Fx {
  final String? name;
  final dynamic currentPrice;
  final dynamic changePct;

  const Fx({this.name, this.currentPrice, this.changePct});

  factory Fx.fromJson(Map<String, dynamic> json) {
    return Fx(
      name: json['name'],
      currentPrice: json['data']['end_rate'],
      changePct: json['data']['change_pct'],
    );
  }
}
