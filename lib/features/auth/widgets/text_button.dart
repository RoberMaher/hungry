// features/auth/widgets/text_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function() ontap;

  const CustomTextButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ontap,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
