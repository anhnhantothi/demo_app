import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionnaireCubit extends Cubit<Map<int, int>> {
  QuestionnaireCubit() : super({});

  void selectOption(int questionNumber, int optionIndex) {
    final updated = Map<int, int>.from(state);
    updated[questionNumber] = optionIndex;
    emit(updated);
  }
}
