import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/app/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImages extends StatelessWidget {
  final int productId;
  const ProductImages({
    super.key,
    required ValueNotifier<int> selectedIndex, required this.productId,
  }) : _selectedIndex = selectedIndex;

  final ValueNotifier<int> _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 250.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _selectedIndex.value = index;
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  //margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(
                      color: SullionAppColor.primaryBlackColor),
                  child: Center(
                    child: Text(
                      'text $i',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: SullionAppColor.primaryBackgroundColor,
                          ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 13.h,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _selectedIndex,
            builder: (BuildContext context, int value, Widget? child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      width: 10,
                      height: 10,
                      //color: SullionAppColor.primaryBlackColor,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: SullionAppColor.primaryBackgroundColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: i == _selectedIndex.value
                            ? SullionAppColor.primaryBlackColor
                            : SullionAppColor.iconButtonBackgroundColor,
                      ),
                    ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
