import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_therapy/components/OptionToAnswer/models/OptionToAnswerModel.dart';

class OptionToAnswerComponent extends StatelessWidget {
  const OptionToAnswerComponent({super.key, required this.data});
  final OptionToAnswerModel data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 11),
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(60),
        border: Border.all(color: Color(0xFFB5B4B4))
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon(data.icon),
          // const SizedBox(
          //   width: 8,
          // ),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Font',
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 16,
              height: 1.4,
              letterSpacing: 0.0,
            ),
          ),
        ],
      )
      ,
    );
  }
}
