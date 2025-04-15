import 'package:flutter/material.dart';
import 'package:last_watched_tracker/features/auth/presentation/widgets/social_sign_in_button.dart';
import 'package:last_watched_tracker/utils/constants/constants.dart';

class SocialSignInOptions extends StatelessWidget {
  const SocialSignInOptions({super.key, this.introText = 'Or continue with'});

  final String introText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            introText,
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          AppConstants.mediumSizedBox,

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialSignInButton(
                icon: Icons.g_mobiledata,
                onPressed: () {
                  // Handle Google sign in
                },
              ),
              AppConstants.mediumSizedBox,
              SocialSignInButton(
                icon: Icons.facebook,
                onPressed: () {
                  // Handle Facebook sign in
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
