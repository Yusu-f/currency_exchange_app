import 'package:currency_exchange_app/services/local_storage.dart';
import 'package:currency_exchange_app/util/keys.dart';

import '../Api/api_services.dart';

class Repository {
  static final Repository _repository = Repository._internal();
  ApiServices apiservices = ApiServices();
  LocalStorage localStorage = LocalStorage();

  factory Repository() {
    return _repository;
  }

  getFxdata() async {
    return await apiservices.getFxdata();
  }

  getCryptoData() async {
    return await apiservices.getCryptoData();
  }

  getTimeSeries(range, currency) async {
    return await apiservices.getTimeSeries(range, currency);
  }

  saveLast(val) {
    localStorage.saveToken(KEY_LAST, val);
  }

  checkLast() {
    return localStorage.getToken(KEY_LAST);
  }

  Repository._internal();
}
