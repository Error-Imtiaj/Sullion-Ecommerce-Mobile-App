import 'package:ecommerce_project/app/colors.dart';
import 'package:ecommerce_project/features/auth/ui/widgets/app_square_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});
  static const String routeName = '/complete-profile';

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _shippingAddressController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0).w,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Gap(100.h),
            AppLogoWidget(
              height: 80.h,
              width: 80.w,
            ),
            Gap(25.h),
            Text(
              "Complete Profile",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "Get started with us with your details",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Gap(25.h),
            _buildProfileForm(),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  //_navigateToNextScreen();
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
    ));
  }

  Widget _buildProfileForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _firstNameController,
            decoration: const InputDecoration(
              hintText: "First Name",
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "First name is required";
              }
              return null;
            },
          ),
          Gap(15.h),
          TextFormField(
            controller: _lastNameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              hintText: "Last Name",
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Last name is required";
              }
              return null;
            },
          ),
          Gap(15.h),
          TextFormField(
            controller: _mobileController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              hintText: "Mobile Number",
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Mobile is required";
              }
              if (!RegExp(r'^(?:\+88|88)?01[3-9]\d{8}$').hasMatch(value)) {
                return "Invalid mobile number";
              }
              return null;
            },
          ),
          Gap(15.h),
          TextFormField(
            controller: _cityController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              hintText: "City",
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "City is required";
              }
              return null;
            },
          ),
          Gap(15.h),
          TextFormField(
            controller: _shippingAddressController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: "Shipping Address",
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Shipping is required";
              }
              return null;
            },
          ),
          Gap(15.h),
        ],
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    _cityController.dispose();
    _shippingAddressController.dispose();
    super.dispose();
  }
}
