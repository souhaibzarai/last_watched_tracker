import 'package:flutter_bloc/flutter_bloc.dart';

class CheckArchiveCubit extends Cubit<bool> {
  CheckArchiveCubit() : super(true);

  void setArchiveStatus(bool isArchive) {
    emit(isArchive);
  }
}
