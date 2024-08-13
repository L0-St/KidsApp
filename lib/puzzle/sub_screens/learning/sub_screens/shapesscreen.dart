import 'package:flutter/material.dart';
import 'package:iti/helpers/cons.dart';
import 'package:iti/widgets/learningwidget.dart';


class ShapesScreen extends StatelessWidget {
  const ShapesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LearningWidget(imagesList: shapesImage, wordsList: shapesName, title: "Shapes", underTitle: "shape", isNumberPage: false);
  }
}
