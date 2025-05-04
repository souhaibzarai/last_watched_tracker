import 'package:flutter/material.dart';

import '../../../../utils/constants/constants.dart';
import 'social_sign_in_button.dart';

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
          AppConstants.verticalMediumSizedBox,

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialSignInButton(
                icon: Icons.g_mobiledata,
                onPressed: () {
                  // Handle Google sign in
                },
              ),
              AppConstants.verticalMediumSizedBox,
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
