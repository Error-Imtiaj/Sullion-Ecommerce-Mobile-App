import 'package:ecommerce_project/app/colors.dart';
import 'package:ecommerce_project/features/cart/ui/widget/cart_widget.dart';
import 'package:ecommerce_project/features/common/ui/controllers/main_nav_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _onPop() {
    Get.find<MainNavButtonController>().moveToHome();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didpop) => _onPop(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(
            onPressed: () {
              _onPop();
            },
            icon: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CartWidget(),
                  );
                },
              ),
            ),
            _checkOut(),
          ],
        ),
      ),
    );
  }

  Widget _checkOut() {
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
                "Checkout",
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
