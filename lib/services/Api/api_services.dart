import 'dart:convert';

import 'package:currency_exchange_app/models/Crypto.dart';
import 'package:currency_exchange_app/models/Time_series.dart';
import 'package:http/http.dart' as http;

import '../../models/Fx.dart';

class ApiServices {
  Future<http.Response> doGetFullRequest(String endPoint) async {
    return http.get(
      Uri.parse(endPoint),
    );
  }

  Future getFxdata() async {
    try {
      DateTime dateToday = DateTime.now().subtract(const Duration(days: 1));
      DateTime dateYesterday = DateTime.now().subtract(const Duration(days: 2));

      String today = dateToday.toString().substring(0, 10);
      String yesterday = dateYesterday.toString().substring(0, 10);

      var res = await doGetFullRequest(
          "https://api.exchangerate.host/fluctuation?start_date=$yesterday&end_date=$today&base=USD");
      if (isConnectionSuccesful(res.statusCode)) {
        var rates = jsonDecode(res.body)['rates'];
        List<Fx> list = [];
        rates.forEach((k, v) {
          list.add(Fx.fromJson({'name': k, 'data': v}));
        });
        return list;
      }
    } catch (e) {
      print(e);
    }
  }

  Future getCryptoData() async {
    try {
      DateTime dateToday = DateTime.now().subtract(const Duration(days: 1));
      DateTime dateYesterday = DateTime.now().subtract(const Duration(days: 2));

      String today = dateToday.toString().substring(0, 10);
      String yesterday = dateYesterday.toString().substring(0, 10);

      var res = await doGetFullRequest(
          "http://api.coinlayer.com/api/live?access_key=f0256a6db87c1539d2ea40dd01a84ed4");

      if (isConnectionSuccesful(res.statusCode)) {
        var rates = jsonDecode(res.body)['rates'];
        List<Crypto> list = [];
        rates.forEach((k, v) {
          list.add(Crypto.fromJson({'name': k, 'currentPrice': v}));
        });
        return list;
      }
    } catch (e) {
      print(e);
    }
  }

  Future getTimeSeries(range, currency) async {
    try {
      int days = 0;
      switch (range) {
        case "year":
          {
            days = 366;
          }
          break;
        case "week":
          {
            days = 8;
          }
          break;
        case "month":
          {
            days = 31;
          }
          break;
        case "day":
          {
            days = 2;
          }
      }

      DateTime dateToday = DateTime.now().subtract(const Duration(days: 1));
      DateTime dateYesterday = DateTime.now().subtract(Duration(days: days));

      String today = dateToday.toString().substring(0, 10);
      String yesterday = dateYesterday.toString().substring(0, 10);

      var res = await doGetFullRequest(
          "https://api.exchangerate.host/timeseries?start_date=$yesterday&end_date=$today&symbols=$currency&base=USD");

      if (isConnectionSuccesful(res.statusCode)) {
        var rates = jsonDecode(res.body)['rates'];
        List<TimeSeries> list = [];

        rates.forEach((k, v) {
          var arr = k.split('-');
          list.add(TimeSeries.fromJson({
            'day': arr[2],
            'month': arr[1],
            'year': arr[0],
            'epoch':
                (DateTime.parse(k)).toUtc().millisecondsSinceEpoch.toDouble(),
            'price': v["$currency"]
          }));
          // print({
          //   'day': arr[2],
          //   'month': arr[1],
          //   'year': arr[0],
          //   'epoch': (DateTime.parse(k)).toUtc().millisecondsSinceEpoch,
          //   'price': v["USD"].toString()
          // });
        });
        return list;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<http.Response> doPostRequest(String endPoint, Map payload) async {
    // var header = await _getNormalHeader();
    return http.post(
      Uri.parse(endPoint),
      //  headers: header,
      body: payload,
    );
  }

  bool isConnectionSuccesful(int statusCode) {
    return statusCode == 201 || statusCode == 200;
  }
}
