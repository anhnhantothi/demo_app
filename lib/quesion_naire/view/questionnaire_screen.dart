import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_therapy/quesion_naire/cubit/questionnaire_cubit.dart';
import 'package:music_therapy/widget/step_press.dart';

class QuestionnaireScreen extends StatelessWidget {
  const QuestionnaireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuestionnaireCubit(),
      child: const QuestionnaireView(),
    );
  }
}

class QuestionnaireView extends StatelessWidget {
  const QuestionnaireView({super.key});

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
            child: const StepProgressIndicator(currentStep: 2, totalSteps: 4),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  "Let's imagine the following situation:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text("In a few moments... [full instruction text here]."),
                const SizedBox(height: 16),
                BlocBuilder<QuestionnaireCubit, Map<int, int>>(
                  builder: (context, state) {
                    return Column(
                      children: List.generate(20, (index) {
                        return _buildQuestion(
                          context,
                          index + 1,
                          state[index + 1],
                        );
                      }),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestion(BuildContext context, int number, int? selected) {
    const options = ["Not at all", "A little", "Moderately", "A lot"];
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$number. Are you feeling calm?",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: List.generate(options.length, (optionIndex) {
                return ChoiceChip(
                  label: Text(options[optionIndex]),
                  selected: selected == optionIndex,
                  onSelected: (_) {
                    context.read<QuestionnaireCubit>().selectOption(
                      number,
                      optionIndex,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
