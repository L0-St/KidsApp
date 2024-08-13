import 'package:flutter/material.dart';
import 'package:iti/helpers/cons.dart';
import 'package:iti/widgets/puzzlewidget.dart';



class ShapesPuzzle extends StatelessWidget {
  const ShapesPuzzle({super.key});

  @override
  Widget build(BuildContext context) {
    return PuzzleWidget(imagesList: shapesImage,wordsList:shapesName );
  }
}
