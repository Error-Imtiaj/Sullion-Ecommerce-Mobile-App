import 'package:ecommerce_project/features/app/sullion_theme.dart';
import 'package:ecommerce_project/features/auth/ui/screens/email_verification_scrren.dart';
import 'package:ecommerce_project/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SullionApp extends StatefulWidget {
  const SullionApp({super.key});

  @override
  State<SullionApp> createState() => _SullionAppState();
}

class _SullionAppState extends State<SullionApp> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: Size(width, height),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          routes: routes,
          theme: SullionAppThemeData.lightThemeData,
        );
      },
    );
  }

  Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    EmailVerificationScreen.routeName: (context) =>
        const EmailVerificationScreen(),
  };
}
