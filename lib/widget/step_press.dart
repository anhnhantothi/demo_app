import 'package:flutter/material.dart';

class StepProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepProgressIndicator({
    required this.currentStep,
    required this.totalSteps,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearProgressIndicator(
            value: currentStep / totalSteps,
            color: Colors.green,
            backgroundColor: Colors.grey.shade300,
            minHeight: 2,
          ),
          const SizedBox(height: 4),
          Text(
            'Step $currentStep of $totalSteps',
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
