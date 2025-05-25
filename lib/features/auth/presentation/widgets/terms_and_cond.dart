import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/theme/app_colors.dart';
import '../cubit/check_cubit.dart';

class TermsAndCond extends StatelessWidget {
  const TermsAndCond({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckCubit, bool>(
      builder: (context, isChecked) {
        return Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                context.read<CheckCubit>().changeValue(value ?? false);
              },
              checkColor: AppColors.textColor,
              side: BorderSide(width: 1, color: AppColors.infoColor),
              fillColor: WidgetStatePropertyAll(AppColors.secondaryTextColor),
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: 'I agree to the ',
                  style: TextStyle(color: AppColors.textColor, fontSize: 12.sp),
                  children: [
                    TextSpan(
                      text: 'Terms & Conditions',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: ' and ',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
