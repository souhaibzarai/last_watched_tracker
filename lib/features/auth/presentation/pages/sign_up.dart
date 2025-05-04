import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import '../../data/models/user_creation.dart';
import '../../domain/usecases/sign_up.dart';
import '../cubit/check_cubit.dart';
import '../widgets/custom_auth_text.dart';
import '../widgets/password_text_field.dart';
import '../widgets/terms_and_cond.dart';
import '../widgets/under_button_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(
      appBar: CustomAppBar(),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is SuccessButtonState) {
              AppCommons.showScaffold(context, message: 'sign up successfull');
            } else if (state is FailureButtonState) {
              AppCommons.showScaffold(context, message: state.errMsg);
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: BlocProvider(
                  create: (_) => CheckCubit(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomAuthText(
                        title: 'Create Account',
                        subTitle: 'Sign up to get started',
                      ),

                      CustomTextField(
                        controller: _usernameController,
                        labelText: 'Username',
                        prefixIcon: Icons.person_outline,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      AppConstants.verticalMediumSizedBox,

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

                      PasswordTextField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      AppConstants.verticalMediumSizedBox,

                      PasswordTextField(
                        controller: _confirmPasswordController,
                        title: 'Confirm Password',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password must be at least 6 characters';
                          } else if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      AppConstants.verticalSmallSizedBox,

                      const TermsAndCond(),

                      BlocBuilder<CheckCubit, bool>(
                        builder: (context, isChecked) {
                          if (isChecked) {
                            return Column(
                              children: [
                                AppConstants.verticalSmallSizedBox,
                                Builder(
                                  builder: (context) {
                                    return CustomReactiveButton(
                                      text: 'Sign Up',
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          await context
                                              .read<ButtonStateCubit>()
                                              .execute(
                                                usecase: SignUpUseCase(),
                                                params: UserCreation(
                                                  username:
                                                      _usernameController.text
                                                          .trim(),
                                                  email:
                                                      _emailController.text
                                                          .trim(),
                                                  password:
                                                      _passwordController.text
                                                          .trim(),
                                                ),
                                              );
                                        }
                                      },
                                    );
                                  },
                                ),
                                AppConstants.verticalMediumSizedBox,
                              ],
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),

                      UnderButtonText(
                        text: "Already have an account?",
                        clickableText: "Sign In",
                        onTextClick: () {
                          context.replace(NavigatorPath.login);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
