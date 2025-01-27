import 'package:ecommerce_project/app/app_constants.dart';
import 'package:ecommerce_project/app/colors.dart';
import 'package:ecommerce_project/features/auth/ui/controllers/email_verification_controller.dart';
import 'package:ecommerce_project/features/auth/ui/screens/email_otp_verify.dart';
import 'package:ecommerce_project/features/auth/ui/widgets/app_square_logo_widget.dart';
import 'package:ecommerce_project/features/common/ui/widgets/center_circular_progress_indicatore.dart';
import 'package:email_validator/email_validator.dart';
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
  final emailVerificationController = Get.find<EmailVerificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.all(SullionAppConstants.scaffoldBodyPaddingConst)
                  .w,
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
                    if (EmailValidator.validate(value!)) {
                      return null;
                    } else {
                      return "Please enter a valid email address";
                    }
                  },
                ),
                Gap(15.h),
                GetBuilder<EmailVerificationController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const CenterCircularProgressIndicatore();
                  }
                  return ElevatedButton(
                    onPressed: _navigateToNextScreen,
                    child: Text(
                      "Next",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: SullionAppColor.primaryBackgroundColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToNextScreen() {
    if (!formkey.currentState!.validate()) {
      return;
    } else {
      emailVerificationController
          .verifyEmail(_emailController.text.trim())
          .then((verificationSuccessful) {
        if (verificationSuccessful) {
          // * Navigate to the next screen only if verification is successful
          Get.toNamed(EmailOtpVerify.routeName);
        } else {
          // * Handle verification failure, e.g., show an error message
          Get.snackbar('Error', 'Email verification failed.');
        }
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
