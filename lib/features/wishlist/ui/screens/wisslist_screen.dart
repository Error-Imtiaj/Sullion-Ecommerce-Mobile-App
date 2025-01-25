import 'package:ecommerce_project/app/app_constants.dart';
import 'package:ecommerce_project/features/common/ui/controllers/main_nav_button_controller.dart';
import 'package:ecommerce_project/features/common/ui/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WisslistScreen extends StatefulWidget {
  const WisslistScreen({super.key});

  @override
  State<WisslistScreen> createState() => _WisslistScreenState();
}

class _WisslistScreenState extends State<WisslistScreen> {
  void _onPop() {
    Get.find<MainNavButtonController>().moveToHome();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => _onPop(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Wishlist"),
          leading: IconButton(
            onPressed: () {
              _onPop();
            },
            icon: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.all(SullionAppConstants.scaffoldBodyPaddingConst)
                  .w,
          child: GridView.builder(
            itemCount: 16, // Replace with the actual item count
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 15.h,
              childAspectRatio: 0.8, // Adjust to control the height of items
            ),
            // physics: const BouncingScrollPhysics(), // Adds smooth scrolling
            itemBuilder: (context, index) {
              return ProductWidget();
            },
          ),
        ),
      ),
    );
  }
}
