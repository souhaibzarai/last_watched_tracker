import 'package:flutter/material.dart';

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
  });

  final TextEditingController? controller;
  final String labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool isDescriptive;
  final bool isOptional;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:
          validator ??
          (value) {
            if (isOptional) {
              return null;
            }
            if (value == null || value.isEmpty) {
              return 'Please enter a valid ${labelText.toLowerCase()}';
            }
            return null;
          },
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText && !isDescriptive,
      cursorColor: AppColors.infoColor,
      cursorWidth: 1,
      minLines: isDescriptive ? 3 : 1,
      maxLines: isDescriptive ? 4 : 1,
      cursorErrorColor: AppColors.errorColor,
      style: const TextStyle(color: AppColors.textColor),
      decoration: InputDecoration(
        constraints: BoxConstraints(),
        labelText: labelText,
        hintStyle: const TextStyle(color: Colors.white54),
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: Colors.white70) : null,
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
          color: AppColors.successColor,
        ),
      ),
    );
  }
}
