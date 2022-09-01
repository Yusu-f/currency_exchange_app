import 'package:currency_exchange_app/pages/controllers/home_controller.dart';
import 'package:currency_exchange_app/pages/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
        child: BottomAppBar(
          color: const Color(0xff333333),
          child: Container(
            height: 80,
            padding: const EdgeInsets.all(25),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
                  },
                  child: SvgPicture.asset(
                    'assets/svgs/home.svg',
                    color: const Color(0xff609FFF),
                  ),
                ),
                // const SizedBox(width: 210.22),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/svgs/chart.svg',
                    color: const Color(0xff828282),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/svgs/explore.svg',
                    color: const Color(0xff828282),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/svgs/wallet.svg',
                    color: const Color(0xff828282),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/svgs/user.svg',
                    color: const Color(0xff828282),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}