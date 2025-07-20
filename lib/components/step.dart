import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_therapy/components/cubit/step_cubit.dart';

class StepProgressIndicator extends StatefulWidget {
  const StepProgressIndicator({super.key});

  @override
  State<StepProgressIndicator> createState() => _StepProgressIndicatorState();
}

class _StepProgressIndicatorState extends State<StepProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepCubit, StepStatePress>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: state.currentStep / state.totalStep,
                color: Colors.green,
                backgroundColor: Colors.grey.shade300,
                minHeight: 2,
              ),
              const SizedBox(height: 4),
              Text(
                'Step ${state.currentStep} of ${state.totalStep}',
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }
}
