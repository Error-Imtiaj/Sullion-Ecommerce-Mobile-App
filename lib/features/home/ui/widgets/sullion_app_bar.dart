import 'package:ecommerce_project/app/assetspath.dart';
import 'package:ecommerce_project/features/home/ui/widgets/sullion_app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SullionAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SullionAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80.h,
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
    );
  }

  @override

  Size get preferredSize => Size(double.infinity, 80.h);
}
