// features/orderHistory/views/order_history_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_button.dart';
import 'package:hungry/shared/custom_text.dart';

class OrderHistoryView extends StatelessWidget {
  static const String routeName = '/order-history';

  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 120, top: 20),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/test/test1.png',
                                      width: 100.w,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: 'Hamburger',
                                      weight: FontWeight.bold,
                                    ),
                                    CustomText(text: 'Qty: 2'),
                                    CustomText(text: 'Price: \$10.00'),
                                  ],
                                ),
                              ],
                            ),
                            Gap(20.h),
                            CustomButton(
                              onPressed: () {},
                              text: 'Order Again',
                              width: double.infinity,
                              color: Colors.grey.shade400,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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

                    const Spacer(),

                    CustomButton(onPressed: () {}, text: 'Checkout'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
