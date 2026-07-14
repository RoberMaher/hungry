// features/home/widgets/user_header.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/logo.svg',
              color: AppColors.primaryColor,
              height: 35.h,
            ),
            const Spacer(),
            CircleAvatar(
              radius: 25.r,
              backgroundColor: Colors.grey.shade200,
              child: Icon(Icons.person, size: 24.sp),
            ),
          ],
        ),

        Gap(8.h),

        /// 🔹 Greeting
        CustomText(
          text: 'Hello, Rober!',
          color: Colors.grey.shade500,
          size: 18.sp,
          weight: FontWeight.w500,
        ),
      ],
    );
  }
}
