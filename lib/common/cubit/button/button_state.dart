abstract class ButtonState {}

class InitialButtonState extends ButtonState {}

class LoadingButtonState extends ButtonState {}

class SuccessButtonState extends ButtonState {}

class FailureButtonState extends ButtonState {
  final String errMsg;

  FailureButtonState({required this.errMsg});
}
