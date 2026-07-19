// features/product/widgets/adds_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class AddsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onAdd;
  const AddsCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 99.h,
          width: 84.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),

        Positioned(
          child: Container(
            height: 61.h,
            width: 84.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),

        Positioned(
          top: 10.h,
          left: 10.w,
          right: 10.w,
          child: Image.asset(imageUrl, height: 45.h, fit: BoxFit.contain),
        ),

        Positioned(
          bottom: 8.h,
          left: 8.w,
          right: 8.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: title, size: 12.sp, weight: FontWeight.w500, color: Colors.white),

              Container(
                height: 22.h,
                width: 22.w,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: GestureDetector(
                  onTap: () {
                    onAdd();
                  },
                  child: Icon(Icons.add, size: 14, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
