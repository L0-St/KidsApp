import 'package:flutter/material.dart';
import 'package:iti/cons.dart';
import 'package:iti/learningwidget.dart';


class ShapesScreen extends StatelessWidget {
  const ShapesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LearningWidget(imagesList: shapesImage, wordsList: shapesName, title: "Shapes", underTitle: "shape", isNumberPage: false);
  }
}
