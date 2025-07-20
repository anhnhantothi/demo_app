import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'step_state.dart';

class StepCubit extends Cubit<StepStatePress> {
  StepCubit() : super(StepStatePress());

  initState(num total){
    emit(StepStatePress(currentStep: 1,totalStep: total));
  }

  nextEvent(){
    if(!(state.currentStep == state.totalStep)) {emit(state.copyWith(currentStep: state.currentStep+1));}
  }
}
