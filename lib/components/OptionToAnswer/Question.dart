import 'package:flutter/material.dart';
import 'package:music_therapy/components/OptionToAnswer/models/QuestionModel.dart';

import 'OptionToAnswer.dart';
import 'models/OptionToAnswerModel.dart';

class QuestionComponent extends StatelessWidget {
  const QuestionComponent({super.key, required this.data});
  final QuestionModel data;


  @override
  Widget build(BuildContext context) {

    buildListAnswers(){
      return Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [...answers.map((e) => OptionToAnswerComponent(
          data: e,
        )
          ,)],
      );
    }




    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            data.question,
            style: TextStyle(
              fontFamily: 'Font',
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 20,
              height: 1.5,
              letterSpacing: 0.0,
            ),
          ),
          const SizedBox(height: 16,),
          buildListAnswers()
        ],
      ),
    );  }
}
List<OptionToAnswerModel> answers = [
  OptionToAnswerModel(title: "😰 Not at all", icon: Icons.abc_outlined),
  OptionToAnswerModel(title: "😔 A little", icon: Icons.abc_outlined),
  OptionToAnswerModel(title: "😐 Moderately", icon: Icons.abc_outlined),
  OptionToAnswerModel(title: "😊 A lot", icon: Icons.abc_outlined),
];