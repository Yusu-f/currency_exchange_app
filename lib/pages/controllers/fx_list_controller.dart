import 'package:flutter/material.dart';

import '../../models/Fx.dart';
import '../../services/repository/repository.dart';
import '../views/fx_list.dart';

class FxListScreen extends StatefulWidget {
  const FxListScreen({Key? key}) : super(key: key);

  @override
  State<FxListScreen> createState() => FxListController();
}

class FxListController extends State<FxListScreen> {
  Repository repository = Repository();

  Future<List<Fx>?> fetchFxCurrencies() async {
    try {
      var res = await repository.getFxdata();
      return res;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FxListView(this);
  }
}
