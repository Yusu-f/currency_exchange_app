import 'package:currency_exchange_app/Providers/fx_provider.dart';
import 'package:currency_exchange_app/Providers/home_provider.dart';
import 'package:currency_exchange_app/pages/controllers/landing_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => HomeProvider(),
              ),
              ChangeNotifierProvider(
                create: (context) => FxProvider(),
              )
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'First page',
              // You can use the library anywhere in the app even in theme
              theme: ThemeData(
                primarySwatch: Colors.green,
              ),
              home: child,
            ),
          );
        },
        child: const LandingPageScreen());
  }
}
