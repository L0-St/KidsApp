import 'package:flutter/material.dart';
import 'package:iti/helpers/cons.dart';
import 'package:iti/widgets/learningwidget.dart';


class NumbersScreen extends StatelessWidget {
  const NumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LearningWidget(imagesList:numbersImage,wordsList:numbersName,title: "Numbers",underTitle: "tangible number",isNumberPage: true,);
  }
}

