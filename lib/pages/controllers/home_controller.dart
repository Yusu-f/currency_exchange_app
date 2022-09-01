
import 'package:currency_exchange_app/pages/controllers/crypto_list_controller.dart';
import 'package:currency_exchange_app/pages/controllers/fx_list_controller.dart';
import 'package:flutter/material.dart';

import '../../services/repository/repository.dart';
import '../views/home.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeController();
}

class HomeController extends State<HomeScreen> {
  Repository repository = Repository();

  checkLast(context) async {
    var lastPage = await repository.checkLast();
    if (lastPage == "Crypto") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CryptoListScreen()),
      );
    } else if (lastPage == "Fiat") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FxListScreen()),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return HomeView(this);
  }
}
