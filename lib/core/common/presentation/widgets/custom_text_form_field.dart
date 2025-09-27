import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final TextInputType? inputType;
  final bool obscureText;
  final int? min;
  final int? max;
  final Widget? suffix;
  final Widget? preffix;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? fillColor;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomTextFormField ({
    super.key,
    this.hintText,
    this.hintStyle,
    this.inputType,
    this.obscureText = false,
    this.min,
    this.max,
    this.suffix,
    this.preffix,
    this.backgroundColor,
    this.borderColor,
    this.fillColor,
    this.onFieldSubmitted,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: inputType,
      // ✅ Ensure obscureText fields are always single line
      maxLines: obscureText ? 1 : (max ?? 1),
      minLines: obscureText ? 1 : (min ?? 1),
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        filled: true,
        fillColor: fillColor ?? backgroundColor ?? const Color(0xffF5F5F5),
        prefixIcon: preffix,
        suffixIcon: suffix,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }
}
