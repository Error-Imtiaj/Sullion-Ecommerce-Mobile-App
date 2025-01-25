import 'package:ecommerce_project/app/app_constants.dart';
import 'package:ecommerce_project/app/colors.dart';
import 'package:ecommerce_project/features/product/ui/screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(ProductScreen.routeName, arguments: 1);
      },
      child: SizedBox(
        width: 150.w,
        child: Card(
          margin: EdgeInsets.only(
              right: SullionAppConstants.gapBetweenProductWidget.w),
          color: Colors.transparent,
          shadowColor: SullionAppColor.iconButtonBackgroundColor,
          elevation: 0,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10).w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: SullionAppColor.iconButtonBackgroundColor,
                      blurRadius: 2,
                      offset: const Offset(0, 0),
                      spreadRadius: 1.r,
                    ),
                  ],
                  color: SullionAppColor.iconButtonBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          SullionAppConstants.productWidgetsRadius.r),
                      topRight: Radius.circular(
                          SullionAppConstants.productWidgetsRadius.r)),
                ),
                child: Image.asset(
                  'assets/images/product.png',
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
              ),
              Gap(4.h),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                        SullionAppConstants.productWidgetsRadius.r),
                    bottomRight: Radius.circular(
                        SullionAppConstants.productWidgetsRadius.r),
                  ),
                  color: SullionAppColor.iconButtonBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: SullionAppColor.iconButtonBackgroundColor,
                      blurRadius: 2,
                      offset: const Offset(0, 0),
                      spreadRadius: 1.r,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Perfume bottle with syrup",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 11.sp),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Gap(4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$100",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 10.sp, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 17.sp,
                            ),
                            Text(
                              "4.5",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.favorite,
                          size: 17.sp,
                        ),
                      ],
                    ),
                    Gap(8.h)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
