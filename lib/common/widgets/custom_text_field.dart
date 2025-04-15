import 'package:flutter/material.dart';
import 'package:last_watched_tracker/common/app_commons.dart';
import 'package:last_watched_tracker/utils/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    required this.labelText,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  final TextEditingController? controller;
  final String labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a valid ${labelText.toLowerCase()}';
            }
            return null;
          },
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: const TextStyle(color: AppColors.textColor),
      decoration: InputDecoration(
        constraints: BoxConstraints(),
        labelText: labelText,
        hintStyle: const TextStyle(color: Colors.white54),
        prefixIcon: Icon(prefixIcon, color: Colors.white70),
        suffixIcon: suffixIcon,
        filled: true,

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
