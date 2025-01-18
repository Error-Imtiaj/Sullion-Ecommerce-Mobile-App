import 'package:ecommerce_project/app/colors.dart';
import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  final TextEditingController controller;
  const ProductSearchBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(10),
        prefixIcon:  Icon(
          Icons.search,
          color: SullionAppColor.primaryBlackColor,
        ),
        hintText: "Search",
        filled: true,
        fillColor: SullionAppColor.iconButtonBackgroundColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
