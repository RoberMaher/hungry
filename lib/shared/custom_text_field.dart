// shared/custom_text_field.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String? hint;
  final String? label;
  final TextEditingController controller;
  final bool isPassword;
  final Color color;

  const CustomTextField({
    super.key,
    this.hint,
    this.label,
    required this.controller,
    this.isPassword = false,
    this.color = Colors.white,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: widget.color == Colors.white
            ? AppColors.primaryColor
            : Colors.white,
        fontSize: 14.sp,
      ),
      controller: widget.controller,
      cursorHeight: 15.h,
      cursorColor: widget.color == Colors.white
          ? AppColors.primaryColor
          : Colors.white,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
        labelText: widget.label,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: widget.color == Colors.white
                      ? AppColors.primaryColor
                      : Colors.white,
                  size: 20.sp,
                ),
              )
            : null,
        hintText: widget.hint,
        filled: true,
        fillColor: widget.color,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${widget.hint}';
        }
        return null;
      },
      obscureText: _obscureText,
    );
  }
}
