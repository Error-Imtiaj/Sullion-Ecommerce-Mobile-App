import 'package:ecommerce_project/features/app/app_constants.dart';
import 'package:ecommerce_project/features/app/colors.dart';
import 'package:ecommerce_project/features/auth/ui/screens/email_verification_scrren.dart';
import 'package:ecommerce_project/features/auth/ui/widgets/app_name_text_widget.dart';
import 'package:ecommerce_project/features/auth/ui/widgets/app_square_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "/splash-screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _navigateToNextScreen() async {
    await Future.delayed(
        const Duration(seconds: SullionAppConstants.splashScreenTimeoutInSecs));
    Get.offNamed(EmailVerificationScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SullionAppColor.primaryBackgroundColor,
      body: Column(
        children: [
          const Spacer(),
          const AppLogoWidget(),
          const AppNameTextWidget(),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "E-COMMERCE  ",
                  style: GoogleFonts.montserrat(
                    letterSpacing: 1.5.sp,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: SullionAppColor.primaryBlackColor,
                  ),
                ),
                TextSpan(
                  text: "STORE",
                  style: GoogleFonts.montserrat(
                    letterSpacing: 1.5.sp,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: SullionAppColor.primaryBlackColor,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const CircularProgressIndicator(),
          const Gap(20),
          const Text(
            SullionAppConstants.appVersion,
          ),
          const Gap(30),
        ],
      ),
    );
  }
}
