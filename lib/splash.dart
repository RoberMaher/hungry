// splash.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      body: Center(
        child: Column(
          children: [
            Gap(280.h),
            SvgPicture.asset('assets/icons/logo.svg'),
            Spacer(),
            Image.asset(
              'assets/images/splash_image.png',
            ),
            
          ],
        ),
      ),
    );
  }
}
