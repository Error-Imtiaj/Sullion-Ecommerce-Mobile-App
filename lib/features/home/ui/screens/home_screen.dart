import 'package:ecommerce_project/app/app_constants.dart';
import 'package:ecommerce_project/features/home/ui/widgets/carusal_slider.dart';
import 'package:ecommerce_project/features/home/ui/widgets/product_widget.dart';
import 'package:ecommerce_project/features/home/ui/widgets/search_bar.dart';
import 'package:ecommerce_project/features/home/ui/widgets/single_collection_widget.dart';
import 'package:ecommerce_project/features/home/ui/widgets/sullion_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../widgets/home_screen_title.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home-screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SullionAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: SullionAppConstants.scaffoldBodyPaddingConst),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProductSearchBar(
                controller: searchController,
              ),
              Gap(24.h),
              const SullionAppCarosalSlider(),
              Gap(24.h),
              // * COLLECTION SECTION
              HomeScreenTitle(
                title: 'Collections',
                onPressedViewAll: () {},
              ),
              Gap(16.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getCollection(),
                ),
              ),
              Gap(16.h),

              // * POPULAR SECTION
              HomeScreenTitle(
                title: 'Popular',
                onPressedViewAll: () {},
              ),
              Gap(16.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductCollection(),
                ),
              ),
              Gap(16.h),

              // * SPECIAL SECTION
              HomeScreenTitle(
                title: 'Special',
                onPressedViewAll: () {},
              ),
              Gap(16.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductCollection(),
                ),
              ),
              Gap(16.h),

              // * NEW SECTION
              HomeScreenTitle(
                title: 'New',
                onPressedViewAll: () {},
              ),
              Gap(16.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductCollection(),
                ),
              ),
              Gap(16.h),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getCollection() {
    List<Widget> collectionList = [];
    for (int i = 0; i < 5; i++) {
      collectionList.add(const SingleCollectionWidget());
    }
    return collectionList;
  }

  List<Widget> _getProductCollection() {
    List<Widget> collectionList = [];
    for (int i = 0; i < 5; i++) {
      collectionList.add(const ProductWidget());
    }
    return collectionList;
  }
}
