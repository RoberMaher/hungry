// features/auth/views/login_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/widgets/custom_auth_button.dart';
import 'package:hungry/features/auth/widgets/text_button.dart';
import 'package:hungry/root.dart';
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
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gap(160.h),

                SvgPicture.asset(
                  'assets/icons/logo.svg',
                  color: AppColors.primaryColor,
                ),

                Gap(10.h),

                CustomText(
                  text: 'Welcome Back, Discover The Fastest Food Delivery',
                  size: 12.sp,
                  weight: FontWeight.w500,
                ),

                Gap(60.h),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 30.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        Gap(20.h),
                        CustomTextField(
                          hint: 'Email Address',
                          controller: emailController,
                        ),

                        Gap(15.h),

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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'Don\'t have an account?',
                              size: 12.sp,
                              weight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            Transform.translate(
                              offset: const Offset(-7, 0),
                              child: CustomTextButton(
                                text: 'Sign Up',
                                ontap: () {
                                  Navigator.pushNamed(context, '/signup');
                                },
                              ),
                            ),
                          ],
                        ),
                        CustomTextButton(
                          text: 'Continue as Guest?',
                          ontap: () {
                            // Handle continue as guest logic here
                            Navigator.pushNamed(context, Root.routeName); // Replace with your guest route
                          },
                        ),
                      ],
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
}
