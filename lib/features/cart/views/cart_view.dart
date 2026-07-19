// features/cart/views/cart_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/cart/widgets/card_item.dart';
import 'package:hungry/features/checkout/views/checkout_view.dart';
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
          ],
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
              child: CustomButton(onPressed: () {
                Navigator.pushNamed(context, CheckoutView.routeName);
              }, text: 'Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
