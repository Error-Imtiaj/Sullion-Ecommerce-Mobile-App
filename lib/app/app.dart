import 'package:ecommerce_project/app/controller_binder.dart';
import 'package:ecommerce_project/app/sullion_theme.dart';
import 'package:ecommerce_project/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:ecommerce_project/features/auth/ui/screens/email_otp_verify.dart';
import 'package:ecommerce_project/features/auth/ui/screens/email_verification_scrren.dart';
import 'package:ecommerce_project/features/auth/ui/screens/splash_screen.dart';
import 'package:ecommerce_project/features/category/ui/screens/category_page.dart';
import 'package:ecommerce_project/features/common/ui/screens/sullion_app_bottom_navbar.dart';
import 'package:ecommerce_project/features/home/ui/screens/home_screen.dart';
import 'package:ecommerce_project/features/product/ui/screen/product_list_screen.dart';
import 'package:flutter/material.dart';
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
          initialBinding: ControllerBinder(),
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.name,
          routes: _staticRoutes,
          onGenerateRoute: _generateRoute,
          theme: SullionAppThemeData.lightThemeData,
        );
      },
    );
  }

  // Static routes for screens without dynamic arguments
  final Map<String, Widget Function(BuildContext)> _staticRoutes = {
    SplashScreen.name: (context) => const SplashScreen(),
    EmailVerificationScreen.routeName: (context) =>
        const EmailVerificationScreen(),
    EmailOtpVerify.routeName: (context) => const EmailOtpVerify(),
    CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
    SullionAppBottomNavbar.routeName: (context) =>
        const SullionAppBottomNavbar(),
    HomeScreen.routeName: (context) => const HomeScreen(),
    CategoryPage.routeName: (context) => const CategoryPage(),
  };

  // Dynamic route generator for screens with arguments
  Route<dynamic> _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ProductListScreen.routeName:
        final categoryName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ProductListScreen(categoryName: categoryName),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('404: Page Not Found')),
          ),
        );
    }
  }
}
