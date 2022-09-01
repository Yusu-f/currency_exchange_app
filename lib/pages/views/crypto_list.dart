import 'package:currency_exchange_app/models/Crypto.dart';
import 'package:currency_exchange_app/mvc/mvc.dart';
import 'package:currency_exchange_app/widgets/views/bottom_nav.dart';
import 'package:currency_exchange_app/widgets/views/crypto_row.dart';
import 'package:currency_exchange_app/widgets/views/my_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../services/repository/repository.dart';
import '../controllers/crypto_list_controller.dart';

class CryptoListView extends StatelessView<CryptoListScreen, CryptoListController> {
  const CryptoListView(CryptoListController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44.h),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
             SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Coin",
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffBDBDBD)),
                  ),
                ),
                // Expanded(child: SizedBox()),
                Expanded(
                  child: Text(
                    "Last price",
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffBDBDBD)),
                  ),
                ),
                Text(
                  "Vol 24h",
                  style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffBDBDBD)),
                )
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            FutureBuilder(
                future: controller.fetchCryptoCurrencies(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    List items = snapshot.data;
                    return Expanded(
                      child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, index) =>
                              CryptoRow(
                                name: items[index].name,
                                currentPrice: items[index].currentPrice,
                              )),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav()
    );;
  }
}