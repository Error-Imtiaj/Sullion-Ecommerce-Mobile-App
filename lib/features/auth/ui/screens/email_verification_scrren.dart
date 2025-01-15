import 'package:ecommerce_project/features/app/colors.dart';
import 'package:ecommerce_project/features/auth/ui/widgets/app_square_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Gap(100),
              const AppLogoWidget(),
              const Gap(25),
              Text(
                "Welcome Back",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "Please enter your email address",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Gap(25),
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
              const Gap(15),
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
            ],
          ),
        ),
      ),
    );
  }
}
