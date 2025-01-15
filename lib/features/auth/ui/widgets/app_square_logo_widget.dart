import 'package:ecommerce_project/features/app/assetspath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        Assetspath.appSquarelogo,
        width: 130.w,
        height: 130.h,
      ),
    );
  }
}
