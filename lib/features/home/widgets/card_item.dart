// features/home/widgets/card_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/shared/custom_text.dart';

class CardItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final double rating;
  const CardItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 185.w,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: -10,

                    child: Image.asset('assets/images/shadow.png'),
                  ),
                  Center(child: Image.asset(image, width: 120.w)),
                ],
              ),
              Gap(15.h),
              CustomText(text: title, weight: FontWeight.bold),
              CustomText(text: description),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.yellow.shade700, size: 20.sp),
                  Gap(5.w),
                  CustomText(text: rating.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
