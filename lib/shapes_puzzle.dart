import 'package:flutter/material.dart';
import 'package:iti/cons.dart';
import 'package:iti/puzzlewidget.dart';



class ShapesPuzzle extends StatelessWidget {
  const ShapesPuzzle({super.key});

  @override
  Widget build(BuildContext context) {
    return PuzzleWidget(imagesList: shapesImage,wordsList:shapesName );
  }
}
