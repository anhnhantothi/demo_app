import 'package:flutter_bloc/flutter_bloc.dart';

class ConsentFormState {
  final bool isAccepted;

  ConsentFormState({required this.isAccepted});
}

class ConsentFormCubit extends Cubit<ConsentFormState> {
  ConsentFormCubit() : super(ConsentFormState(isAccepted: false));

  void toggleAccept(bool value) {
    emit(ConsentFormState(isAccepted: value));
  }
}
