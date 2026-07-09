// features/cart/view/cart_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatelessWidget {
  static const String routeName = '/cart';

  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Cart View', style: TextStyle(fontSize: 24.sp)),
      ),
    );
  }
}
