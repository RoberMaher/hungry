// features/cart/widgets/card_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class Card_Item extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int quantity;
  final VoidCallback? onRemove;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  const Card_Item({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.quantity,
    this.onRemove,
    this.onIncrement,
    this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ).w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(image, width: 90.w, height: 90.h),
                  Gap(8.h),

                  CustomText(
                    text: title,
                    size: 16.sp,
                    weight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),

                  CustomText(
                    text: description,
                    size: 14.sp,
                    weight: FontWeight.w500,
                    color: AppColors.primaryColor.withOpacity(0.5),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Quantity Row
                  Row(
                    children: [
                      /// Minus Button
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.remove, color: Colors.white),
                      ),

                      Gap(25.w),

                      CustomText(
                        text: quantity.toString(),
                        size: 16.sp,
                        weight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),

                      Gap(25.w),

                      /// Plus Button
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),

                  Gap(40.h),

                  Container(
                    width: 154.w,
                    height: 43.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Remove',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
