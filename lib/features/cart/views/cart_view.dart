// features/cart/views/cart_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/cart/widgets/card_item.dart';
import 'package:hungry/shared/custom_button.dart';
import 'package:hungry/shared/custom_text.dart';

class CartView extends StatefulWidget {
  static const String routeName = '/cart';

  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<int> quantities = List.generate(4, (index) => 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// LIST
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: quantities.length,
                itemBuilder: (context, index) {
                  return Card_Item(
                    image: 'assets/test/test1.png',
                    title: 'Hamburger',
                    description: 'Veggie Burger',

                    quantity: quantities[index],

                    onIncrement: () {
                      setState(() {
                        quantities[index]++;
                      });
                    },

                    onDecrement: () {
                      setState(() {
                        if (quantities[index] > 1) {
                          quantities[index]--;
                        }
                      });
                    },
                  );
                },
              ),
            ),

            /// BOTTOM BAR
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, -4), // 🔥 من فوق بس
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
    );
  }
}
