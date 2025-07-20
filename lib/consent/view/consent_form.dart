import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_therapy/components/OptionToAnswer/models/QuestionModel.dart';
import 'package:music_therapy/components/step.dart';
import 'package:music_therapy/quesion_naire/view/questionnaire_screen.dart';
import '../../components/OptionToAnswer/Question.dart';
import '../../components/cubit/step_cubit.dart';

class ConsentFormScreen extends StatefulWidget {
  const ConsentFormScreen({super.key, required this.title});
  final String title;
  @override
  State<ConsentFormScreen> createState() => _ConsentFormScreenState();
}

class _ConsentFormScreenState extends State<ConsentFormScreen> {
  final StepCubit cubit = StepCubit();

  @override
  void initState() {
    cubit.initState(20);
    print(cubit.state.totalStep);
    super.initState();
  }

  List<QuestionModel> questions = [
    QuestionModel(question: "1. Are you feeling calm?"),
    QuestionModel(question: "2. Are you feeling calm?"),
    QuestionModel(question: "3. Are you feeling calm?"),
    QuestionModel(question: "4. Are you feeling calm?"),
    QuestionModel(question: "5. Are you feeling calm?"),
    QuestionModel(question: "6. Are you feeling calm?"),
    QuestionModel(question: "7. Are you feeling calm?"),
    QuestionModel(question: "8. Are you feeling calm?"),
    QuestionModel(question: "9. Are you feeling calm?"),
    QuestionModel(question: "10. Are you feeling calm?"),
  ];

  buildListQuestions() {
    return Column(
      spacing: 16,
      children: [...questions.map((e) => QuestionComponent(data: e))],
    );
  }

  buildStepOne() {
    return Column(children: [buildListQuestions()]);
  }

  buildStepTwo() {
    return QuestionnaireScreen(title: '');
  }

  buildContent() {
    switch (cubit.state.currentStep) {
      case 2:
        {
          return buildStepTwo();
        }
      default:
        return buildStepOne();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(widget.title, style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        backgroundColor: Color(0xFFF1F2F2),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocProvider.value(value: cubit, child: StepProgressIndicator()),
            Expanded(
              child: SingleChildScrollView(
                child: BlocBuilder<StepCubit, StepStatePress>(
                  builder: (context, state) {
                    return buildContent();
                  },
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              cubit.nextEvent();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text("Next", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
