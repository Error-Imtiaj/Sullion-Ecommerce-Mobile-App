import 'package:ecommerce_project/app/app_constants.dart';
import 'package:ecommerce_project/app/colors.dart';
import 'package:ecommerce_project/features/product/ui/widgets/description_widget.dart';
import 'package:ecommerce_project/features/product/ui/widgets/picker_widget.dart';
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
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        _ratingWidget(),
                        const Gap(8),
                        // * COLOR PCIKER
                        PickerWidget(
                          title: "Color",
                          items: ['Red', 'Green', 'Black'],
                          onChanged: (String value) {
                            print(value);
                          },
                        ),
                        const Gap(8),
                        // * SIZE PCIKER
                        PickerWidget(
                          title: "Size",
                          items: ['XXL', 'XL', 'L', 'M', 'S'],
                          onChanged: (String value) {
                            print(value);
                          },
                        ),

                        // * DESCRIPTION
                        const Gap(8),
                        const DescriptionWidget(
                            description:
                                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // * ADD TO CART BUTTON
          _addToCartSection()
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

  Widget _addToCartSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: SullionAppColor.primarygreyColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                "\$100",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Add to Cart",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: SullionAppColor.primaryBackgroundColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
