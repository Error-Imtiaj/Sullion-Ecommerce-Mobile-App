import 'package:ecommerce_project/app/app_constants.dart';
import 'package:ecommerce_project/features/common/ui/controllers/main_nav_button_controller.dart';
import 'package:ecommerce_project/features/home/ui/widgets/single_collection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  static const String routeName = '/category';
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
        leading: IconButton(
          onPressed: () {
            Get.find<MainNavButtonController>().moveToHome();
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(SullionAppConstants.scaffoldBodyPaddingConst)
                .w,
        child: GridView.builder(
            itemCount: 16,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, crossAxisSpacing: 8, mainAxisSpacing: 24),
            itemBuilder: (context, index) {
              return const FittedBox(child: SingleCollectionWidget());
            }),
      ),
    );
  }
}
