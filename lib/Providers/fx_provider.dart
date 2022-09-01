import 'package:flutter/material.dart';

class FxProvider extends ChangeNotifier {
  String _range = "week";

  String get range => _range;

  changeRange(v) {
    _range = v;
    notifyListeners();
  }
}
