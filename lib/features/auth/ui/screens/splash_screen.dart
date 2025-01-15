import 'package:ecommerce_project/features/app/assetspath.dart';
import 'package:ecommerce_project/features/app/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SullionAppColor.primaryBackgroundColor,
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: SvgPicture.asset(
              Assetspath.appSquarelogo,
              width: 30,
              height: 30,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
