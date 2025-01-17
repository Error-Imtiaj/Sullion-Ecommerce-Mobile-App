import 'package:ecommerce_project/app/colors.dart';
import 'package:flutter/material.dart';

class SullionAppNavigationDestination extends StatelessWidget {
  final IconData icon;
  final String label;
  const SullionAppNavigationDestination({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
        icon: Icon(
          icon,
          color: SullionAppColor.primaryBlackColor,
        ),
        label: label);
  }
}
