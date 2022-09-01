
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../models/Fx.dart';
import '../../services/repository/repository.dart';
import '../views/currency_details.dart';


class CurrencyDetailsScreen extends StatefulWidget {
  CurrencyDetailsScreen({Key? key, required this.currency}) : super(key: key);
  String currency;

  @override
  State<CurrencyDetailsScreen> createState() => CurrencyDetailsController();
}

class CurrencyDetailsController extends State<CurrencyDetailsScreen> {
  Repository repository = Repository();

  fetchTimeSeries(range, currency) async {
    try {
      List res = await repository.getTimeSeries(range, currency);
      List<FlSpot> list = [];

      int interval = 1;
      if (range == "year") interval = 29;

      for (var i = 0; i < res.length; i += interval) {
        list.add(FlSpot(
            res[i].epoch, double.parse(res[i].price.toStringAsFixed(1))));
      }

      return list;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Fx>?> fetchWatchlistData() async {
    try {
      var res = await repository.getFxdata();
      res.length = 10;
      return res;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CurrencyDetailsView(this);
  }
}
