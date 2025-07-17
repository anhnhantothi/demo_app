import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_therapy/consent/cubit/consent_form_cubit.dart';
import 'package:music_therapy/quesion_naire/view/questionnaire_screen.dart';
import 'package:music_therapy/widget/step_press.dart';

class ConsentFormScreen extends StatelessWidget {
  const ConsentFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Melody Mindcare',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: const StepProgressIndicator(currentStep: 1, totalSteps: 4),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Consent form",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Prospective Observational Study on the Effect of Music in Reducing Stress Before a Coronary Angiography",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<ConsentFormCubit, ConsentFormState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Checkbox(
                            value: state.isAccepted,
                            onChanged: (value) {
                              context.read<ConsentFormCubit>().toggleAccept(
                                value ?? false,
                              );
                            },
                          ),
                          const Expanded(
                            child: Text(
                              "I have read and understood the consent form and voluntarily agree to participate in this study.",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<ConsentFormCubit, ConsentFormState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.green),
                        ),
                        child: const Text(
                          "Reject",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed:
                              state.isAccepted
                                  ? () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder:
                                            (_) => const QuestionnaireScreen(),
                                      ),
                                    );
                                  }
                                  : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text(
                            "Next",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
