import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator.dart';
import '../../domain/usecases/fetch_status.dart';
import 'status_state.dart';

class StatusCubit extends Cubit<StatusState> {
  StatusCubit() : super(StatusInitial());

  Future<void> fetchStatus() async {
    emit(StatusLoading());

    try {
      final returnedData = await serviceLocator<FetchStatusUseCase>().call();

      returnedData.fold(
        (err) => emit(StatusFailure(err: err.toString())),
        (data) => emit(StatusLoaded(status: data)),
      );
    } catch (e) {
      emit(StatusFailure(err: e.toString()));
    }
  }
}
