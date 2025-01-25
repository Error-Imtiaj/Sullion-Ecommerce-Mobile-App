import 'package:ecommerce_project/app/app_constants.dart';
import 'package:ecommerce_project/features/product/ui/controller/cart_number_controller.dart';
import 'package:ecommerce_project/features/product/ui/widgets/product_images.dart';
import 'package:ecommerce_project/features/product/ui/widgets/product_page_cart_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductScreen extends StatefulWidget {
  final int productId;
  const ProductScreen({super.key, required this.productId});
  static const String routeName = '/product';
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  final cartNumberControl = Get.find<CartNumberController>();
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
                Row(
                  children: [
                    Text(
                      "Product Name",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    ProductPageCartCounterButton(
                      onTap: () {
                        cartNumberControl.decrement();
                      },
                      icon: Icons.remove,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Obx(() => Text(
                            cartNumberControl.cartNum.toString(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          )),
                    ),
                    ProductPageCartCounterButton(
                      onTap: () {
                        cartNumberControl.increment();
                      },
                      icon: Icons.add,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
