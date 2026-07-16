// features/checkout/views/checkout_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/checkout/widgets/order_details_widget.dart';
import 'package:hungry/features/checkout/widgets/success_dialog.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_button.dart';

class CheckoutView extends StatefulWidget {
  static const String routeName = '/checkout';

  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedPayment = 'cash';
  bool isChecked = false; // ✅ state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
            size: 20.sp,
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

            Expanded(
              child: CustomButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => SuccessDialog(),
                  );
                },
                text: 'Pay Now',
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🧾 Order Summary
              CustomText(
                text: 'Order Summary',
                size: 20.sp,
                weight: FontWeight.w500,
              ),

              Gap(10.h),

              OrderDetailsWidget(
                order: '\$50.00',
                tax: '\$20.00',
                deliveryFees: '\$5.00',
                total: '\$75.00',
              ),

              Gap(30.h),

              CustomText(
                text: 'Payment methods',
                size: 20.sp,
                weight: FontWeight.w500,
              ),

              Gap(10.h),

              ListTile(
                onTap: () {
                  setState(() => selectedPayment = 'cash');
                },
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 8.h,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                tileColor: selectedPayment == 'cash'
                    ? AppColors.primaryColor
                    : Colors.grey.shade200,
                leading: Image.asset('assets/icons/dollar.png', width: 50.w),
                title: CustomText(
                  text: 'Cash on delivery',
                  size: 15.sp,
                  weight: FontWeight.w400,
                  color: selectedPayment == 'cash'
                      ? Colors.white
                      : Colors.black,
                ),
                trailing: Radio<String>(
                  value: 'cash',
                  groupValue: selectedPayment,
                  activeColor: Colors.white,
                  onChanged: (value) {
                    setState(() => selectedPayment = value!);
                  },
                ),
              ),

              Gap(10.h),

              ListTile(
                onTap: () {
                  setState(() => selectedPayment = 'visa');
                },
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 2.h,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                tileColor: selectedPayment == 'visa'
                    ? AppColors.primaryColor
                    : Colors.grey.shade200,
                leading: Image.asset('assets/icons/visa.png', width: 60.w),
                title: CustomText(
                  text: 'Visa card',
                  size: 15.sp,
                  weight: FontWeight.w400,
                  color: selectedPayment == 'visa'
                      ? Colors.white
                      : Colors.black,
                ),
                subtitle: CustomText(
                  text: '**** **** **** 1234',
                  size: 12.sp,
                  weight: FontWeight.w400,
                  color: selectedPayment == 'visa'
                      ? Colors.white70
                      : Colors.black54,
                ),
                trailing: Radio<String>(
                  value: 'visa',
                  groupValue: selectedPayment,
                  activeColor: Colors.white,
                  onChanged: (value) {
                    setState(() => selectedPayment = value!);
                  },
                ),
              ),

              Gap(5.h),

              Row(
                children: [
                  Transform.translate(
                    offset: Offset(10.w, 0),
                    child: Checkbox(
                      value: isChecked,
                      activeColor: Colors.red,
                      onChanged: (value) {
                        setState(() => isChecked = value!);
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomText(
                      text: 'Save card details for future payments',
                      size: 14.sp,
                      weight: FontWeight.w400,
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
