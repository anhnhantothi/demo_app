part of 'step_cubit.dart';
class StepStatePress  extends Equatable {
  final num currentStep;
  final num totalStep;
  const StepStatePress({ this.currentStep = 0,  this.totalStep = 1});

  StepStatePress copyWith({
    num? currentStep,
    num? totalStep,
})=>StepStatePress(
    currentStep: currentStep ?? this.currentStep,
    totalStep: totalStep ?? this.totalStep
  );

  @override
  List<Object?> get props => [currentStep,totalStep];
}


