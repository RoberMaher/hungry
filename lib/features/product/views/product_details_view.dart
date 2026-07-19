// features/product/views/product_details_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/product/widgets/adds_card.dart';
import 'package:hungry/features/product/widgets/spicy_slider.dart';
import 'package:hungry/shared/custom_button.dart';
import 'package:hungry/shared/custom_text.dart';

class ProductDetailsView extends StatefulWidget {
  static const String routeName = '/product';

  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  double sliderValue = 0.5;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: AppColors.primaryColor,
              size: 20.sp,
            ),
          ),
        ),
      
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0).w,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpicySlider(
                  value: sliderValue,
                  onChanged: (value) {
                    setState(() => sliderValue = value);
                  },
                ),
      
                Gap(20.h),
      
                CustomText(
                  text: 'Toppings',
                  size: 20.sp,
                  weight: FontWeight.bold,
                ),
      
                Gap(10.h),
      
                SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      6,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AddsCard(
                          imageUrl: 'assets/images/tomato.png',
                          title: 'Tomato',
                          onAdd: () {
                            // Handle add action
                          },
                        ),
                      ),
                    ),
                  ),
                ),
      
                Gap(20.h),
      
                CustomText(
                  text: 'Side Options',
                  size: 20.sp,
                  weight: FontWeight.bold,
                ),
      
                Gap(10.h),
      
                SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      6,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AddsCard(
                          imageUrl: 'assets/images/tomato.png',
                          title: 'Tomato',
                          onAdd: () {
                            // Handle add action
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: Offset(0, -4),
              ),
            ],
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: 'Total Price',
                    size: 18.sp,
                    weight: FontWeight.bold,
                  ),
                  CustomText(
                    text: '\$12.99',
                    size: 16.sp,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
      
              Spacer(),
      
              CustomButton(onPressed: () {}, text: 'Add to Cart'),
            ],
          ),
        ),
      ),
    );
  }
}
