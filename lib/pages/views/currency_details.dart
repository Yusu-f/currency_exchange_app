import 'package:currency_exchange_app/Providers/fx_provider.dart';
import 'package:currency_exchange_app/widgets/views/bottom_nav.dart';
import 'package:currency_exchange_app/widgets/views/fx_row.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../models/Fx.dart';
import '../../mvc/mvc.dart';
import '../../services/repository/repository.dart';
import '../../util/currencies.dart';
import '../controllers/currency_details_controller.dart';

class CurrencyDetailsView extends StatelessView<CurrencyDetailsScreen, CurrencyDetailsController> {
  const CurrencyDetailsView(CurrencyDetailsController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: REdgeInsets.fromLTRB(20, 48, 20, 0),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (() => Navigator.pop(context)),
                      child: SvgPicture.asset("assets/svgs/chevron-left.svg")),
                  Row(
                    children: [
                      SvgPicture.asset("assets/svgs/eth_icon.svg"),
                      const Text("ETH/USDT"),
                    ],
                  ),
                  SvgPicture.asset("assets/svgs/stats.svg")
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 54.h,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF1F0F0),
                    labelText: widget.currency,
                    labelStyle: TextStyle(
                        color: const Color(0xff828282),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff38CB89),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffD1D5DB),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff38cb89),
                        width: 2,
                      ),
                    ),
                  ),
                  items: currencies.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (index) {
                    print(index);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CurrencyDetailsScreen(
                                currency: index.toString(),
                              )),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Container(
                    color: const Color(0xff27AE60),
                    width: 6.w,
                    height: 60.h,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("IDR 853.134.900",
                          style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff333333))),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/svgs/bulk_arrow_up.svg"),
                          Text("105 (%0.8)",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff27AE60)))
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                child: Padding(
                  padding: REdgeInsets.fromLTRB(19.r, 6.r, 0, 6.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(alignment: Alignment.center, children: [
                        Visibility(
                          visible:
                              Provider.of<FxProvider>(context).range == "day",
                          child: Container(
                            width: 40.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: const Color(0xff2C2C33)),
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: (() =>
                                Provider.of<FxProvider>(context, listen: false)
                                    .changeRange("day")),
                            child: Text(
                              "24H",
                              style: TextStyle(
                                  color:
                                      Provider.of<FxProvider>(context).range ==
                                              "day"
                                          ? Colors.white
                                          : Colors.black,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ]),
                      Stack(alignment: Alignment.center, children: [
                        Visibility(
                          visible:
                              Provider.of<FxProvider>(context).range == "week",
                          child: Container(
                            width: 40.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: const Color(0xff2C2C33)),
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: (() =>
                                Provider.of<FxProvider>(context, listen: false)
                                    .changeRange("week")),
                            child: Text(
                              "1W",
                              style: TextStyle(
                                  color:
                                      Provider.of<FxProvider>(context).range ==
                                              "week"
                                          ? Colors.white
                                          : Colors.black,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ]),
                      Stack(alignment: Alignment.center, children: [
                        Visibility(
                          visible:
                              Provider.of<FxProvider>(context).range == "month",
                          child: Container(
                            width: 40.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: const Color(0xff2C2C33)),
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: (() =>
                                Provider.of<FxProvider>(context, listen: false)
                                    .changeRange("month")),
                            child: Text(
                              "1M",
                              style: TextStyle(
                                  color:
                                      Provider.of<FxProvider>(context).range ==
                                              "month"
                                          ? Colors.white
                                          : Colors.black,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ]),
                      Stack(alignment: Alignment.center, children: [
                        Visibility(
                          visible:
                              Provider.of<FxProvider>(context).range == "year",
                          child: Container(
                            width: 40.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: const Color(0xff2C2C33)),
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: (() =>
                                Provider.of<FxProvider>(context, listen: false)
                                    .changeRange("year")),
                            child: Text(
                              "1Y",
                              style: TextStyle(
                                  color:
                                      Provider.of<FxProvider>(context).range ==
                                              "year"
                                          ? Colors.white
                                          : Colors.black,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
              ),
              FutureBuilder(
                  future: controller.fetchTimeSeries(
                      Provider.of<FxProvider>(context).range, widget.currency),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data != null) {
                      List<FlSpot> items = snapshot.data;
                      return Container(
                        //width: double.infinity,
                        color: const Color(0xffBFBFBF).withOpacity(0.1),
                        height: 280.h,
                        child: LineChart(
                          LineChartData(
                            titlesData: FlTitlesData(
                                show: true,
                                rightTitles: AxisTitles(),
                                topTitles: AxisTitles(),
                                bottomTitles: AxisTitles()),
                            borderData: FlBorderData(show: false),
                            gridData: FlGridData(show: false),
                            lineBarsData: [
                              LineChartBarData(
                                isCurved: true,
                                color: const Color(0xff27AE60),
                                barWidth: 2,
                                dotData: FlDotData(show: false),
                                belowBarData: BarAreaData(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      const Color(0xff27AE60).withOpacity(0.3),
                                      Colors.white,
                                    ],
                                  ),
                                  show: true,
                                ),
                                spots: items,
                              ),
                            ],
                          ),
                          swapAnimationDuration:
                              const Duration(milliseconds: 150),
                          swapAnimationCurve: Curves.linear,
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: REdgeInsets.fromLTRB(46.r, 0, 46.r, 0),
                child: MaterialButton(
                    height: 54.h,
                    minWidth: double.infinity,
                    padding: REdgeInsets.all(12),
                    elevation: 0,
                    onPressed: () {},
                    color: const Color(0xff3374D4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                    // padding: const EdgeInsets.all(16),
                    child: Text(
                      "Add to watchlist",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400),
                    )),
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Quick watch",
                      style: TextStyle(
                          color: const Color(0xff575B66),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400)),
                  Row(
                    children: [
                      Text("See all",
                          style: TextStyle(
                              color: const Color(0xff575B66),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400)),
                      SvgPicture.asset("assets/svgs/arrow_right.svg")
                    ],
                  ),
                ],
              ),
              FutureBuilder(
                  future: controller.fetchWatchlistData(),
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
        bottomNavigationBar: const BottomNav());
  }
}