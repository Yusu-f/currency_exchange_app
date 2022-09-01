
import 'package:currency_exchange_app/pages/views/crypto_list.dart';
import 'package:flutter/material.dart';

import '../../models/Crypto.dart';
import '../../services/repository/repository.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({Key? key}) : super(key: key);

  @override
  State<CryptoListScreen> createState() => CryptoListController();
}

class CryptoListController extends State<CryptoListScreen> {
  Repository repository = Repository();

  Future<List<Crypto>?> fetchCryptoCurrencies() async {
    try {
      var res = await repository.getCryptoData();
      return res;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CryptoListView(this);
  }
}
