import 'package:ecommerce_project/app/app_constants.dart';
import 'package:ecommerce_project/app/colors.dart';
import 'package:ecommerce_project/features/product/ui/widgets/product_cart_num.dart';
import 'package:ecommerce_project/features/product/ui/widgets/product_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductScreen extends StatefulWidget {
  final int productId;
  const ProductScreen({super.key, required this.productId});
  static const String routeName = '/product';
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Page"),
      ),
      body: Column(
        children: [
          // * CAROUSEL SLIDER
          ProductImages(
            selectedIndex: _selectedIndex,
            productId: widget.productId,
          ),

          // * PRODUCT DETAILS
          Padding(
            padding: const EdgeInsets.all(
                    SullionAppConstants.scaffoldBodyPaddingConst)
                .w,
            child: Column(
              children: [
                // * PRODUCT NAME AND CART NUMBER
                Row(
                  children: [
                    // * PRODUCT NAME
                    Expanded(
                      child: Text(
                        "Happy New Year",
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    //const Gap(8),

                    // * CART NUMBER
                    ProductCartNum(onChanged: (int value) {
                      // * return the value of the cart number
                    }),
                  ],
                ),
                // * PRODUCT REVIEW SECTION (STAR RATING AND FAVORITE ICON)
                _ratingWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _ratingWidget() {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 28.sp,
        ),
        Text(
          "4.5",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Gap(16),
        Text(
          "Rating",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const Gap(16),
        IconButton(
          style: IconButton.styleFrom(
              backgroundColor: SullionAppColor.primarygreyColor),
          onPressed: () {
            // * Add to favorite
          },
          icon: Icon(
            Icons.favorite,
            size: 17.sp,
          ),
        ),
      ],
    );
  }
}
