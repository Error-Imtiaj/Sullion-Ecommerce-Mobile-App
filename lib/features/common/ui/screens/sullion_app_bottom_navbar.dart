import 'package:ecommerce_project/app/colors.dart';
import 'package:ecommerce_project/features/common/ui/controllers/main_nav_button_controller.dart';
import 'package:ecommerce_project/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/sullion_nav_destanation.dart';

class SullionAppBottomNavbar extends StatefulWidget {
  static const String routeName = "/nav-screen";
  const SullionAppBottomNavbar({super.key});

  @override
  State<SullionAppBottomNavbar> createState() => _SullionAppBottomNavbarState();
}

class _SullionAppBottomNavbarState extends State<SullionAppBottomNavbar> {
  final List _screen = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavButtonController>(
      builder: (mainNavButtonController) {
        return Scaffold(
          body: _screen[mainNavButtonController.selectedIndex],
          bottomNavigationBar: NavigationBar(
            indicatorColor: SullionAppColor.primaryBackgroundColor,
            selectedIndex: mainNavButtonController.selectedIndex,
            onDestinationSelected: mainNavButtonController.changeIndex,
            backgroundColor: SullionAppColor.iconButtonBackgroundColor,
            destinations: const [
              SullionAppNavigationDestination(
                icon: Icons.home,
                label: "Home",
              ),
              SullionAppNavigationDestination(
                icon: Icons.category,
                label: "Category",
              ),
              SullionAppNavigationDestination(
                icon: Icons.shopping_cart_outlined,
                label: "Cart",
              ),
              SullionAppNavigationDestination(
                icon: Icons.favorite_outline,
                label: "Wish",
              ),
            ],
          ),
        );
      },
    );
  }
}
