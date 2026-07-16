// features/checkout/widgets/success_dialog.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_button.dart';
import 'package:hungry/shared/custom_text.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F3F3),
            borderRadius: BorderRadius.circular(25.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 90.w,
                height: 90.w,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 50),
              ),

              Gap(20.h),

              CustomText(
                text: 'Success !',
                size: 22.sp,
                weight: FontWeight.bold,
              ),

              Gap(10.h),

              CustomText(
                text:
                    'Your payment was successful.\nA receipt for this purchase has\nbeen sent to your email.',
                size: 14.sp,
                weight: FontWeight.w400,
                color: Colors.grey,
              ),

              Gap(25.h),

              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: 'Close',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
