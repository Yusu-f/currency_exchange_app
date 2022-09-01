import 'package:currency_exchange_app/services/repository/repository.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String _val = "";

  Repository repository = Repository();

  String get val => _val;

  changeVal(v) {
    _val = v;
    repository.saveLast(v);
    notifyListeners();
  }
}
