import 'package:ecommerce_project/app/app_constants.dart';
import 'package:ecommerce_project/app/colors.dart';
import 'package:ecommerce_project/features/auth/ui/screens/email_otp_verify.dart';
import 'package:ecommerce_project/features/auth/ui/widgets/app_square_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  static const String routeName = "/email-verification";
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SullionAppConstants.scaffoldBodyPaddingConst).w,
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Gap(100.h),
                const AppLogoWidget(),
                Gap(25.h),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "Please enter your email address",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Gap(25.h),
                TextFormField(
                  controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: Theme.of(context).textTheme.bodyLarge,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Email Address",
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    } else if (!value.contains('@')) {
                      return "Invalid email address";
                    }
                    return null;
                  },
                ),
                Gap(15.h),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      _navigateToNextScreen();
                    }
                  },
                  child: Text(
                    "Next",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: SullionAppColor.primaryBackgroundColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToNextScreen() {
    // * Navigate to the next screen
    Get.toNamed(EmailOtpVerify.routeName);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
