import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/custom_text_field.dart';
import '../cubit/check_cubit.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required TextEditingController controller,
    this.title = 'Password',
    this.validator,
  }) : _passwordController = controller;

  final TextEditingController _passwordController;
  final String title;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckCubit(),
      child: BlocBuilder<CheckCubit, bool>(
        builder: (context, isNotHidden) {
          return CustomTextField(
            validator: validator ,
            controller: _passwordController,
            labelText: title,
            prefixIcon: Icons.lock_outline,
            obscureText: !isNotHidden,
            suffixIcon: GestureDetector(
              child: Icon(
                !isNotHidden
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Colors.white70,
              ),
              onTap: () {
                context.read<CheckCubit>().setObscureStatus();
              },
            ),
          );
        },
      ),
    );
  }
}
