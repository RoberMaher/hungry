// features/checkout/widgets/order_details_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/checkout/widgets/checkout_widget.dart';

class OrderDetailsWidget extends StatelessWidget {
  final String order;
  final String tax;
  final String deliveryFees;
  final String total;

  const OrderDetailsWidget({
    super.key,
    required this.order,
    required this.tax,
    required this.deliveryFees,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckoutWidget(title: 'Order', value: order),
        Gap(5.h),
        CheckoutWidget(title: 'Tax', value: tax),
        Gap(5.h),
        CheckoutWidget(title: 'Delivery Fees', value: deliveryFees),
        Gap(10.h),
        Divider(),
        Gap(10.h),
        CheckoutWidget(title: 'Total', value: total, isBold: true),
        Gap(5.h),
        CheckoutWidget(
          title: 'Estimated delivery time:',
          value: '20-30 minutes',
          isBold: true,
          isSmall: true,
        ),
      ],
    );
  }
}
