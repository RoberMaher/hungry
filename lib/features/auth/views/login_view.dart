// features/auth/view/login_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/wedgits/custom_auth_button.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_text_field.dart';

class LoginView extends StatefulWidget {
  static const String routeName = '/login';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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

                  Gap(10.h),

                  CustomText(
                    text: 'Welcome Back, Discover The Fastest Food Delivery',
                    size: 12.sp,
                    color: Colors.white,
                    weight: FontWeight.w500,
                  ),

                  Gap(70.h),

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

                  Gap(30.h),

                  CustomAuthButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle login logic here
                        print('Email: ${emailController.text}');
                        print('Password: ${passwordController.text}');
                      }
                    },
                    text: 'Login',
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
