import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_commons.dart';

import '../../../utils/theme/app_colors.dart';
import '../../cubit/button/button_state.dart';
import '../../cubit/button/button_state_cubit.dart';

class CustomReactiveButton extends StatelessWidget {
  const CustomReactiveButton({
    super.key,
    this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.height,
  });

  final String? text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsets padding;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonStateCubit, ButtonState>(
      builder: (context, state) {
        final isLoading = state is LoadingButtonState;
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColors.buttonBgColor,
            foregroundColor: AppColors.textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: padding,
            minimumSize: Size(
              MediaQuery.of(context).size.width,
              height ?? 60,
            ),
          ),
          child:
              isLoading
                  ? AppCommons.centerProgressIndicator
                  : Text(
                    text ?? 'Continuer',
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.textColor, //
                    ),
                  ),
        );
      },
    );
  }
}
