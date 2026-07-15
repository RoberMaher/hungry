// features/cart/views/cart_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/cart/widgets/card_item.dart';
import 'package:hungry/shared/custom_button.dart';
import 'package:hungry/shared/custom_text.dart';

class CartView extends StatelessWidget {
  static const String routeName = '/cart';

  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// 🔽 LIST OF ITEMS
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: 6,
                itemBuilder: (context, index) => Card_Item(
                  image: 'assets/test/test1.png',
                  title: 'Hamburger',
                  description: 'Veggie Burger',
                  quantity: 2,
                ),
              ),
            ),

            /// 🔽 BOTTOM SECTION (TOTAL + BUTTON)
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
              ),
              child: Row(
                children: [
                  /// Total
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

                  Spacer(),

                  /// Checkout Button
                  CustomButton(onPressed: () {}, text: 'Checkout'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
