import 'package:ecommerce_project/app/assetspath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../widgets/sullion_app_icon_button.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home-screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          Assetspath.appHorizontalLogo,
          width: 150.w,
        ),
        actions: [
          SullionAppIconButton(
            icon: Icons.person_4_outlined,
            onPressed: () {},
          ),
          Gap(5.w),
          SullionAppIconButton(
            icon: Icons.phone,
            onPressed: () {},
          ),
          Gap(5.w),
          SullionAppIconButton(
            icon: Icons.notifications_active_outlined,
            onPressed: () {},
          ),
          Gap(5.w),
        ],
      ),
    );
  }
}
