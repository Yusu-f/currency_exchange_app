import 'package:currency_exchange_app/models/Crypto.dart';
import 'package:currency_exchange_app/mvc/mvc.dart';
import 'package:currency_exchange_app/pages/controllers/crypto_list_controller.dart';
import 'package:currency_exchange_app/pages/controllers/fx_list_controller.dart';
import 'package:currency_exchange_app/pages/views/crypto_list.dart';
import 'package:currency_exchange_app/pages/views/fx_list.dart';
import 'package:currency_exchange_app/services/repository/repository.dart';
import 'package:currency_exchange_app/widgets/views/bottom_nav.dart';
import 'package:currency_exchange_app/widgets/views/my_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../controllers/home_controller.dart';

class HomeView extends StatelessView<HomeScreen, HomeController> {
  const HomeView(HomeController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    controller.checkLast(context);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(44.h),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "ATS",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff609FFF)),
                  ),
                  Text(
                    "Currency",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff1D1D1D)),
                  )
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              MyDropDown(
                list: const ["Crypto", "Fiat"],
                label: "Select currency",
              ),
              const SizedBox(
                height: 81,
              ),
              SvgPicture.asset("assets/svgs/landing_graphic.svg")
            ],
          ),
        ),
        bottomNavigationBar: const BottomNav());
  }
}