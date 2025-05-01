import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:last_watched_tracker/common/cubit/button/button_state.dart';
import 'package:last_watched_tracker/common/cubit/button/button_state_cubit.dart';
import 'package:last_watched_tracker/common/widgets/custom_text_field.dart';
import 'package:last_watched_tracker/common/widgets/scaffold/custom_app_bar.dart';
import 'package:last_watched_tracker/features/auth/data/models/user_login.dart';
import 'package:last_watched_tracker/features/auth/domain/usecases/sign_in.dart';
import 'package:last_watched_tracker/features/auth/presentation/widgets/password_text_field.dart';
import 'package:last_watched_tracker/utils/constants/constants.dart';
import 'package:last_watched_tracker/utils/helpers/navigator/strings.dart';
import '../../../../common/app_commons.dart';
import '../../../../common/widgets/button/custom_reactive_button.dart';
import '../../../../common/widgets/scaffold/custom_auth_scaffold.dart';
import '../../../../utils/theme/app_colors.dart';
import '../widgets/custom_auth_text.dart';
import '../widgets/under_button_text.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(
      appBar: CustomAppBar(),
      body: BlocProvider<ButtonStateCubit>(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is SuccessButtonState) {
              AppCommons.showScaffold(context, message: 'Login succeed');
              context.pushReplacement(NavigatorPath.home);
            } else if (state is FailureButtonState) {
              AppCommons.showScaffold(context, message: state.errMsg);
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAuthText(
                      title: 'Welcome Back!',
                      subTitle: 'Sign in to continue',
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
                    // Password Field
                    PasswordTextField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'Please enter a valid password';
                        }
                        return null;
                      },
                    ),
                    AppConstants.verticalVerySmallSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            context.push(NavigatorPath.resetPsw);
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    AppConstants.verticalSmallSizedBox,

                    // Sign In Button
                    Builder(
                      builder: (context) {
                        return CustomReactiveButton(
                          text: 'Sign In', //
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await context.read<ButtonStateCubit>().execute(
                                usecase: SignInUseCase(),
                                params: UserLogin(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),

                    AppConstants.verticalMediumSizedBox,

                    // Sign Up Text
                    UnderButtonText(
                      text: "Don't have an account?",
                      clickableText: "Sign Up",
                      onTextClick: () {
                        context.replace(NavigatorPath.signUp);
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
