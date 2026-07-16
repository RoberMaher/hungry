// my_app.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/auth/views/login_view.dart';
import 'package:hungry/features/auth/views/signup_view.dart';
import 'package:hungry/features/checkout/views/checkout_view.dart';
import 'package:hungry/features/product/views/product_details_view.dart';
import 'package:hungry/root.dart';
import 'package:hungry/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignupView(),
        routes: {
          SplashView.routeName: (context) => const SplashView(),
          LoginView.routeName: (context) => const LoginView(),
          SignupView.routeName: (context) => const SignupView(),
          Root.routeName: (context) => const Root(),
          ProductDetailsView.routeName: (context) => const ProductDetailsView(),  
          CheckoutView.routeName: (context) => const CheckoutView(),
        },
      ),
    );
  }
}
