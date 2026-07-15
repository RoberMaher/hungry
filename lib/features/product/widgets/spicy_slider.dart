// features/product/widgets/spicy_slider.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class SpicySlider extends StatefulWidget {
  final double value;
  final ValueChanged<double>? onChanged;

  const SpicySlider({super.key, required this.value, this.onChanged});

  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/ProductDetails.png', height: 250.h),
        Spacer(),
        Column(
          children: [
            CustomText(
              text:
                  'Customize Your Burger\nto Your Tastes.\nUltimate Experience',
            ),
            Slider(
              min: 0,
              max: 1,
              value: widget.value,
              activeColor: AppColors.primaryColor,
              onChanged: widget.onChanged,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: '🥶'),
                Gap(100.w),
                CustomText(text: '🌶️'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
