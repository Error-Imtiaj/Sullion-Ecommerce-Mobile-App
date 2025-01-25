import 'package:ecommerce_project/features/product/ui/controller/cart_number_controller.dart';
import 'package:ecommerce_project/features/product/ui/widgets/product_page_cart_counter_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCartNum extends StatefulWidget {
  final Function(int) onChanged;
  const ProductCartNum({super.key, required this.onChanged});

  @override
  State<ProductCartNum> createState() => _ProductCartNumState();
}

class _ProductCartNumState extends State<ProductCartNum> {
  final cartNumberControl = Get.find<CartNumberController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProductPageCartCounterButton(
          onTap: () {
            cartNumberControl.decrement();
            widget.onChanged(cartNumberControl.cartNum.value);
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
            widget.onChanged(cartNumberControl.cartNum.value);
          },
          icon: Icons.add,
        ),
      ],
    );
  }
}
