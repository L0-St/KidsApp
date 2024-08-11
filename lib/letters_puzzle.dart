import 'package:flutter/material.dart';
import 'package:iti/cons.dart';
import 'package:iti/puzzlewidget.dart';



class LettersPuzzle extends StatelessWidget {
  const LettersPuzzle({super.key});

  @override
  Widget build(BuildContext context) {
    return PuzzleWidget(imagesList: lettersImage,wordsList:wordsList );
  }
}
