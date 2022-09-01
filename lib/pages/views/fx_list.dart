import 'package:currency_exchange_app/models/Fx.dart';
import 'package:currency_exchange_app/pages/controllers/currency_details_controller.dart';
import 'package:currency_exchange_app/pages/views/currency_details.dart';
import 'package:currency_exchange_app/widgets/views/bottom_nav.dart';
import 'package:currency_exchange_app/widgets/views/my_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../mvc/mvc.dart';
import '../../services/repository/repository.dart';
import '../../widgets/views/fx_row.dart';
import '../controllers/fx_list_controller.dart';

class FxListView extends StatelessView<FxListScreen, FxListController> {
  const FxListView(FxListController state, {Key? key}) : super(state, key: key);

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
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Currency",
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffBDBDBD)),
                  ),
                ),
                // Expanded(child: SizedBox()),
                Expanded(
                  child: Text(
                    "USDT",
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffBDBDBD)),
                  ),
                ),
                // SizedBox(
                //   width: 24.w,
                // ),
                Text(
                  "Vol 24h",
                  style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffBDBDBD)),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            FutureBuilder(
                future: controller.fetchFxCurrencies(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    List items = snapshot.data;
                    return Expanded(
                      child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, index) =>
                              GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CurrencyDetailsScreen(
                                            currency: items[index].name,
                                          )),
                                ),
                                child: FxRow(
                                  name: items[index].name,
                                  currentPrice: items[index].currentPrice,
                                  changePct: items[index].changePct,
                                ),
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
    );
  }
}