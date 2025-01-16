import 'dart:async';

import 'package:ecommerce_project/features/app/app_constants.dart';
import 'package:ecommerce_project/features/app/colors.dart';
import 'package:ecommerce_project/features/auth/ui/widgets/app_square_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailOtpVerify extends StatefulWidget {
  const EmailOtpVerify({super.key});
  static const String routeName = '/email-otp-verify';

  @override
  State<EmailOtpVerify> createState() => _EmailOtpVerifyState();
}

class _EmailOtpVerifyState extends State<EmailOtpVerify> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Timer? timer;
  final RxInt _resendCodeInSecs = SullionAppConstants.resendCodeInSecs.obs;
  final RxBool _isResendCodeEnabled = true.obs;

  @override
  void initState() {
    super.initState();
    _resendCountDown();
  }

  void _resendCountDown() {
    _resendCodeInSecs.value = SullionAppConstants.resendCodeInSecs;
    _isResendCodeEnabled.value = false;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_resendCodeInSecs.value == 0) {
        t.cancel();
        _isResendCodeEnabled.value = true;
      } else {
        _resendCodeInSecs.value--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0).w,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gap(100.h),
                const AppLogoWidget(),
                Gap(25.h),
                Text(
                  "Enter OTP Code",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "A 4 digit OTP code has been sent",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Gap(25.h),
                PinCodeTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter the OTP code";
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  appContext: context,
                  controller: _otpController,
                  length: SullionAppConstants.otpLength,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  pinTheme: _pinFieldTheme(),
                ),
                Gap(15.h),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Next",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: SullionAppColor.primaryBackgroundColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Gap(25.h),

                // * RESEND OTP CODE
                Obx(() => RichText(
                      text: TextSpan(
                        text: "This code will expire in ",
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: "${_resendCodeInSecs.value}s",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: SullionAppColor.primaryBlackColor,
                                    fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )),

                // * RESEND OTP CODE BUTTON
                Obx(() => Visibility(
                      visible: _isResendCodeEnabled.value,
                      child: TextButton(
                        style:
                            Theme.of(context).textButtonTheme.style?.copyWith(),
                        onPressed: () {
                          _resendCountDown();
                        },
                        child: Text(
                          "Resend Code",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: SullionAppColor.primaryBlackColor,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // * PIN THEME DATA FOR PIN CODE FIELD
  PinTheme _pinFieldTheme() {
    return PinTheme(
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(5),
      fieldHeight: 50,
      fieldWidth: 40,
      activeFillColor: Colors.white,
      selectedFillColor: Colors.white,
      errorBorderColor: SullionAppColor.primaryBlackColor,
      selectedColor: SullionAppColor.primaryBlackColor,
      inactiveColor: SullionAppColor.primaryBlackColor,
    );
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
