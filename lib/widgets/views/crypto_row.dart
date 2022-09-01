import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoRow extends StatelessWidget {
  const CryptoRow({super.key, this.name, this.currentPrice});

  final String? name;
  final dynamic currentPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 7.r, 0, 7.r),
            child: Row(
              children: [
                SvgPicture.asset("assets/svgs/btc.svg"),
                SizedBox(
                  width: 11.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$name",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff6B6B6B))),
                    Text("$name/USD",
                        style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff828282)))
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: Text("${currentPrice.toStringAsFixed(2)}",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff6B6B6B)))),
        Row(
          children: [
            SvgPicture.asset("assets/svgs/arrow_up_vector.svg"),
            Text("${Random().nextDouble().toStringAsFixed(1)}%",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff4ED46C)))
          ],
        )
      ],
    );
  }
}
