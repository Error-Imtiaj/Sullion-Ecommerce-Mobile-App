import 'package:ecommerce_project/app/app_constants.dart';
import 'package:ecommerce_project/app/colors.dart';
import 'package:ecommerce_project/features/product/ui/screen/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SingleCollectionWidget extends StatelessWidget {
  const SingleCollectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // * Move to the product list screen
        Get.offNamed(ProductListScreen.routeName, arguments: "Computer");
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
                    right: SullionAppConstants.gapBetweenCollections)
                .w,
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: SullionAppColor.iconButtonBackgroundColor,
              borderRadius: BorderRadius.circular(8).r,
            ),
            child: const Icon(
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
      ),
    );
  }
}
