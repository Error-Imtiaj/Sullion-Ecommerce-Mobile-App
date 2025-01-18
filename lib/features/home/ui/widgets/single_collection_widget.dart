import 'package:ecommerce_project/app/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SingleCollectionWidget extends StatelessWidget {
  const SingleCollectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 16).w,
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
              color: SullionAppColor.iconButtonBackgroundColor,
              borderRadius: BorderRadius.circular(8)),
          child: Icon(
            Icons.computer,
            size: 60,
          ),
        ),
        Gap(8.h),
        Text(
          "Computer",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
