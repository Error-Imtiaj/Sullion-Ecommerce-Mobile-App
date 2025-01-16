import 'package:ecommerce_project/features/app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      SullionAppConstants.appName,
      style: GoogleFonts.montserrat(
          letterSpacing: 1.5.sp, fontSize: 50.sp, fontWeight: FontWeight.w700),
    );
  }
}
