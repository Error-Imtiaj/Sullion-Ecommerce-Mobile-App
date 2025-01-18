import 'package:ecommerce_project/app/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      child: Card(
        color: Colors.transparent,
        shadowColor: SullionAppColor.iconButtonBackgroundColor,
        elevation: 0,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: SullionAppColor.iconButtonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
              ),
              child: Image.asset(
                'assets/images/product.png',
                fit: BoxFit.fill,
              ),
            ),
            Gap(1),
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  border: Border.all(
                    color: SullionAppColor.iconButtonBackgroundColor,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color:
                            SullionAppColor.iconButtonBackgroundColor,
                        offset: Offset(0, 4)),
                  ]),
              child: Column(
                children: [
                  Text(
                    "Perfume bottle with syrup",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$100"),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text("4.5"),
                        ],
                      ),
                      Icon(
                        Icons.favorite,
                        size: 22,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
