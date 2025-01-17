import 'package:ecommerce_project/app/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SullionAppIconButton extends StatelessWidget {
  final IconData? icon;
  final Function()? onPressed;
  const SullionAppIconButton({
    super.key,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
          backgroundColor: SullionAppColor.iconButtonBackgroundColor),
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 18.r,
        color: SullionAppColor.primaryBlackColor,
      ),
    );
  }
}
