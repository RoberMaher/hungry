// features/auth/views/signup_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/views/login_view.dart';
import 'package:hungry/features/auth/widgets/custom_auth_button.dart';
import 'package:hungry/features/auth/widgets/text_button.dart';
import 'package:hungry/shared/custom_text.dart';
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
      child: SafeArea(
        top: false,
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
                  CustomText(text: 'Welcome to Our Food App'),
        
                  Gap(70.h),
        
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Gap(20.h),
                            CustomTextField(
                              hint: 'Name',
                              controller: nameController,
                            ),
                            Gap(15.h),
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
                            Gap(15.h),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: 'Already have an account?',
                                  color: Colors.white,
                                ),
                                Transform.translate(
                                  offset: const Offset(-7, 0),
                                  child: CustomTextButton(
                                    text: 'Login',
                                    ontap: () {
                                      Navigator.pushNamed(
                                        context,
                                        LoginView.routeName,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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
