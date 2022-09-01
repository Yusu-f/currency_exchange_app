import 'package:currency_exchange_app/pages/controllers/home_controller.dart';
import 'package:currency_exchange_app/pages/views/home.dart';
import 'package:currency_exchange_app/widgets/views/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../mvc/mvc.dart';
import '../controllers/landing_page_controller.dart';

class LandingPageView extends StatelessView<LandingPageScreen, LandingPageController> {
  const LandingPageView(LandingPageController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
     controller.navigate(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(25, 34, 25, 0),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 64,
                height: 64,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                      "https://s3-alpha-sig.figma.com/img/1772/297d/9cab303f5e1c7a3cf06a7278494fce06?Expires=1662940800&Signature=EwbOF6e2~ppBNkKdJRfhVxwVoUjX-Tx24koffH98zNGM8gldN63BVhRdceviF7zy0LKRoStq4vUEr~DfsLOh03jxcqC5CI8Bk~5Sa0zeXzEgBlhetiqOtBsiAJWrR8QtYG-uDQkD3JyT-ttJVA9kwHSD0YanYq4BHNjuYkdACa1Ly6FHwJj3KbQV1JeV3Aq63SWff0XCRHIzq9rIzP4rNP3kPFR5Ux2Nwo7HYj0X--7s3NXadqbhCXYJSybuNyAsn9CGJBaOgWssU5Dj9r5Uza5bAdr8pkGbRBJeG-0TlqZbL3D97AgAphegD3wIT6Idyo0-ZkJZPP985er33JmAnQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
                ),
              ),
              const SizedBox(
                height: 19,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome,",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff000000))),
                  Text(" Green!",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff609FFF)))
                ],
              ),
              SizedBox(
                height: 81.h,
              ),
              SvgPicture.asset("assets/svgs/landing_graphic.svg")
            ],
          ),
        ),
        bottomNavigationBar: const BottomNav());
  }
}
