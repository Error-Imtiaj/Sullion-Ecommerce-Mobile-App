import 'package:ecommerce_project/app/assetspath.dart';
import 'package:ecommerce_project/app/colors.dart';
import 'package:ecommerce_project/features/product/ui/widgets/product_cart_num.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      // margin: const EdgeInsets.all(8),
      color: SullionAppColor.primaryBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 8, horizontal: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              Assetspath.productPng,
              width: 100,
              height: 100,
              fit: BoxFit.scaleDown,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Product Name",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete))
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Size: Xl",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall,
                      ),
                      Gap(8.w),
                      Text(
                        "Color: RED",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$100",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      ProductCartNum(onChanged: (int value) {})
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
