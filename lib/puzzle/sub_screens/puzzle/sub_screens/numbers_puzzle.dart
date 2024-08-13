import 'package:flutter/material.dart';
import 'package:iti/helpers/cons.dart';
import 'package:iti/widgets/puzzlewidget.dart';



class NumbersPuzzle extends StatelessWidget {
  const NumbersPuzzle({super.key});

  @override
  Widget build(BuildContext context) {
    return PuzzleWidget(imagesList: numbersImage,wordsList:numbersName ,);
  }
}