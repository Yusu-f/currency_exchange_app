
import 'package:flutter/material.dart';

import '../views/landing.dart';
import 'home_controller.dart';


class LandingPageScreen extends StatefulWidget {
  const LandingPageScreen({Key? key}) : super(key: key);

  @override
  State<LandingPageScreen> createState() => LandingPageController();
}

class LandingPageController extends State<LandingPageScreen> {
  navigate(BuildContext context) async {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) {
        return HomeScreen();
      })),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LandingPageView(this);
  }
}
