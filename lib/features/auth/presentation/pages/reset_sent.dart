import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:last_watched_tracker/common/widgets/scaffold/custom_app_bar.dart';
import 'package:last_watched_tracker/features/auth/presentation/widgets/custom_auth_button.dart';
import 'package:last_watched_tracker/utils/helpers/navigator/strings.dart';
import '../../../../common/widgets/scaffold/custom_auth_scaffold.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/messages/message_en.dart';
import '../../../../utils/theme/app_colors.dart';
import '../widgets/custom_auth_text.dart';

class ResetSentPage extends StatelessWidget {
  const ResetSentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomAuthText(
                title: 'Password Reset Sent',
                subTitle: CommonMessagesEn.passwordResetLinkSent,
              ),
              AppConstants.mediumSizedBox,

              // Success Message
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.successColor.withAlpha(22),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Check your inbox for the password reset link.',
                  style: TextStyle(
                    color: AppColors.successColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              AppConstants.mediumSizedBox,

              CustomAuthButton(
                text: 'Back To Sign In',
                onPressed: () {
                  context.replace(login);
                },
              ),
              AppConstants.smallSizedBox,

              // Additional Instructions
              Text(
                'If you don’t receive the email, please check your spam folder or try again.',
                style: TextStyle(color: AppColors.textColor, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
