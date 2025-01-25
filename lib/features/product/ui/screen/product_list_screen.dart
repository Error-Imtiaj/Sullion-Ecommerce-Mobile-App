import 'package:ecommerce_project/app/app_constants.dart';
import 'package:ecommerce_project/features/common/ui/screens/sullion_app_bottom_navbar.dart';
import 'package:ecommerce_project/features/common/ui/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  static const String routeName = '/product-list/product-list-by-category';
  final String categoryName;

  const ProductListScreen({super.key, required this.categoryName});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  void _handleBackNavigation() {
    // Perform any custom logic here
    Get.offNamed(SullionAppBottomNavbar.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => _handleBackNavigation(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.categoryName),
          leading: IconButton(
            onPressed: () {
              _handleBackNavigation();
            },
            icon: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.all(SullionAppConstants.scaffoldBodyPaddingConst)
                  .w,
          child: Center(
            // Ensures the GridView is centered
            child: GridView.builder(
              shrinkWrap: true, // Makes GridView take only the necessary space
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 8, // Spacing between columns
                mainAxisSpacing: 8, // Spacing between rows
              ),
              itemBuilder: (context, index) {
                return const ProductWidget();
              },
              itemCount: 10, // Example item count, update as needed
            ),
          ),
        ),
      ),
    );
  }
}
