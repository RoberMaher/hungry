// features/checkout/widgets/checkout_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class CheckoutWidget extends StatelessWidget {
  final String title;
  final String value;
  final bool isBold;
  final bool isSmall;
  const CheckoutWidget({
    super.key,
    required this.title,
    required this.value,
    this.isBold = false,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          size: isSmall ? 12.sp : 15.sp,
          weight: isBold ? FontWeight.bold : FontWeight.w400,
          color: isBold ? AppColors.primaryColor : Colors.grey.shade500,
        ),
        CustomText(
          text: value,
          size: isSmall ? 12.sp : 15.sp,
          weight: isBold ? FontWeight.bold : FontWeight.w400,
          color: isBold ? AppColors.primaryColor : Colors.grey.shade500,
        ),
      ],
    );
  }
}
