// features/orderHistory/views/order_history_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistoryView extends StatelessWidget {
  static const String routeName = '/order-history';

  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Order History View', style: TextStyle(fontSize: 24.sp)),
      ),
    );
  }
}
