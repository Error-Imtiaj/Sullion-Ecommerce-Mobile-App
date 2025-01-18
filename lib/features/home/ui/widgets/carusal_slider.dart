import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/app/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SullionAppCarosalSlider extends StatefulWidget {
  const SullionAppCarosalSlider({super.key});

  @override
  State<SullionAppCarosalSlider> createState() =>
      _SullionAppCarosalSliderState();
}

class _SullionAppCarosalSliderState extends State<SullionAppCarosalSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
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
                          color: SullionAppColor.primaryBackgroundColor),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Gap(20.h),
        ValueListenableBuilder(
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
                      borderRadius: BorderRadius.circular(10),
                      color: i == _selectedIndex.value
                          ? SullionAppColor.primaryBlackColor
                          : SullionAppColor.iconButtonBackgroundColor,
                    ),
                  ),
              ],
            );
          },
        )
      ],
    );
  }
}
