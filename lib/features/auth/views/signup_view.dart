// features/auth/view/signup_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/wedgits/custom_auth_button.dart';
import 'package:hungry/shared/custom_text_field.dart';

class SignupView extends StatefulWidget {
  static const String routeName = '/signup';

  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0).r,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Gap(100.h),

                  SvgPicture.asset('assets/icons/logo.svg'),

                  Gap(60.h),

                  CustomTextField(hint: 'Name', controller: nameController),
                  Gap(20.h),
                  CustomTextField(
                    hint: 'Email Address',
                    controller: emailController,
                  ),
                  Gap(20.h),
                  CustomTextField(
                    hint: 'Password',
                    controller: passwordController,
                    isPassword: true,
                  ),
                  Gap(20.h),
                  CustomTextField(
                    hint: 'Confirm Password',
                    controller: confirmPasswordController,
                    isPassword: true,
                  ),
                  Gap(30.h),
                  CustomAuthButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle signup logic here
                        print('Name: ${nameController.text}');
                        print('Email: ${emailController.text}');
                        print('Password: ${passwordController.text}');
                      }
                    },
                    text: 'Sign Up',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
