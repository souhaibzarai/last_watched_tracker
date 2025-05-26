import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/scaffold/custom_app_bar.dart';
import '../../../../common/widgets/scaffold/custom_auth_scaffold.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/constants/images_path.dart';
import '../../../../utils/helpers/navigator/strings.dart';
import '../../../../utils/messages/message_en.dart';
import '../../../../utils/theme/app_colors.dart';
import '../widgets/custom_auth_button.dart';
import '../widgets/custom_auth_text.dart';

class ResetSentPage extends StatelessWidget {
  const ResetSentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomAuthText(
                title: 'Password Reset Sent',
                subTitle: CommonMessagesEn.passwordResetLinkSent,
              ),
              AppConstants.verticalMediumSizedBox,
              Image.asset(ImagesPath.emailSent, width: 250.w),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ).r,
                decoration: BoxDecoration(
                  color: AppColors.successColor.withAlpha(22),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Check your inbox for the password reset link.',
                  style: TextStyle(
                    color: AppColors.successColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              AppConstants.verticalMediumSizedBox,

              CustomAuthButton(
                text: 'Back To Sign In',
                onPressed: () {
                  context.replace(NavigatorPath.login);
                },
              ),
              AppConstants.verticalSmallSizedBox,

              // Additional Instructions
              Text(
                'If you don’t receive the email, please check your spam folder or try again.',
                style: TextStyle(color: AppColors.textColor, fontSize: 14.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
