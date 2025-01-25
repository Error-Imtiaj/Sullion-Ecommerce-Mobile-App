
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductPageCartCounterButton extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  const ProductPageCartCounterButton({
    super.key, required this.icon, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      onPressed: onTap,
      icon:  Icon(icon),
    );
  }
}
