import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/app_commons.dart';
import '../../../../common/cubit/button/button_state.dart';
import '../../../../common/cubit/button/button_state_cubit.dart';
import '../../../../common/widgets/button/custom_reactive_button.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/scaffold/custom_app_bar.dart';
import '../../../../common/widgets/scaffold/custom_auth_scaffold.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/helpers/navigator/strings.dart';
import '../../domain/usecases/reset_password.dart';
import '../widgets/custom_auth_text.dart';
import '../widgets/under_button_text.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late TextEditingController _emailController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(
      appBar: CustomAppBar(hideBackButton: false),
      body: BlocProvider<ButtonStateCubit>(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is SuccessButtonState) {
              context.replace(NavigatorPath.resetSent);
            } else if (state is FailureButtonState) {
              AppCommons.showScaffold(context, message: state.errMsg);
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12.0).r,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAuthText(
                      title: 'Reset Password',
                      subTitle: 'Enter your email to reset your password',
                    ),

                    // Email Field
                    CustomTextField(
                      controller: _emailController,
                      labelText: 'Email',
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || !value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    AppConstants.verticalMediumSizedBox,

                    // Reset Password Button
                    Builder(
                      builder: (context) {
                        return CustomReactiveButton(
                          text: 'Send Reset Link',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await context.read<ButtonStateCubit>().execute(
                                usecase: ResetPasswordUseCase(),
                                params: _emailController.text.trim(),
                              );
                            }
                          },
                        );
                      },
                    ),

                    AppConstants.verticalMediumSizedBox,

                    // Back to Sign In Text
                    UnderButtonText(
                      text: 'Remember your password?',
                      clickableText: 'Sign In',
                      onTextClick: () {
                        context.replace(
                          NavigatorPath.login,
                        ); // Navigate back to sign-in page
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
