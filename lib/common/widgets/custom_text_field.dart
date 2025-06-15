import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme/app_colors.dart';
import '../app_commons.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    required this.labelText,
    this.keyboardType,
    this.obscureText = false,
    this.isDescriptive = false,
    this.isOptional = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.hintText,
    this.isNumber = false,
  });

  final TextEditingController? controller;
  final String labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool isDescriptive;
  final bool isOptional;
  final bool isNumber;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:
          validator ??
          (value) {
            if (isOptional && (value == null || value.isEmpty)) {
              return null;
            }
            if (!isOptional && (value == null || value.isEmpty)) {
              return 'Please enter a valid ${labelText.toLowerCase()}';
            }
            if (isNumber && !RegExp(r'^\d+$').hasMatch(value!)) {
              return 'Please enter a valid number';
            }
            return null;
          },
      controller: controller,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUnfocus,
      obscureText: obscureText && !isDescriptive,
      cursorColor: AppColors.infoColor,
      cursorWidth: 1,
      minLines: isDescriptive ? 3 : 1,
      maxLines: isDescriptive ? 4 : 1,
      cursorErrorColor: AppColors.errorColor,
      style: TextStyle(
        color: AppColors.textColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Colors.white70,
              )
            : null,
        suffixIcon: suffixIcon,
        filled: true,
        hintText: hintText,
        fillColor: AppColors.textColor.withAlpha(20),
        border: AppCommons.getOutlineInputBorder(),
        enabledBorder: AppCommons.getOutlineInputBorder(),
        focusedBorder: AppCommons.getOutlineInputBorder(
          color: AppColors.successColor,
        ),
        errorBorder: AppCommons.getOutlineInputBorder(
          color: AppColors.errorColor,
        ),
      ),
    );
  }
}
