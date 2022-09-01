import 'package:currency_exchange_app/Providers/home_provider.dart';
import 'package:currency_exchange_app/pages/controllers/crypto_list_controller.dart';
import 'package:currency_exchange_app/pages/controllers/fx_list_controller.dart';
import 'package:currency_exchange_app/pages/views/crypto_list.dart';
import 'package:currency_exchange_app/pages/views/fx_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyDropDown extends StatelessWidget {
  MyDropDown(
      {Key? key, required this.list, this.label, this.isRequired, this.name})
      : super(key: key);

  final List<String> list;
  final String? name;
  String? label;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Text(name == null ? "" : "$name",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: const Color(0xff111827))),
              Text(
                isRequired == null ? "" : "*",
                style: const TextStyle(color: Colors.red),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        SizedBox(
          height: 54.h,
          child: DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffF1F0F0),
              labelText: '$label',
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
            items: list.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (index) {
              Provider.of<HomeProvider>(context, listen: false)
                  .changeVal(index);
              if (Provider.of<HomeProvider>(context, listen: false).val ==
                  "Crypto") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CryptoListScreen()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FxListScreen()),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
