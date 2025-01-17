import 'package:ecommerce_project/app/assetspath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppLogoWidget extends StatelessWidget {
  final double? width;
  final double? height;
  const AppLogoWidget({
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        Assetspath.appSquarelogo,
        width: width ?? 130.w,
        height: height ?? 130.h,
      ),
    );
  }
}
