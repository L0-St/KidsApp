import 'package:flutter/material.dart';

class cardinfo{
  final int position;
  final String text;
  final String image;
  // Type desiredClass;
  cardinfo(this.position,{
    required this.text,
    required this.image,
    // required this.desiredClass
  });
}
List<cardinfo> cardlist =[
  cardinfo(1,
  text: "Alphabet",
  image: "assets/images/alphabetical.png"),
  cardinfo(2,
      text: "Puzzle",
      image: "assets/images/puzzle.png"),
  cardinfo(3,
      text: "Painting",
      image: "assets/images/paint (1).png"),
  cardinfo(4,
      text: "Stories",
      image: "assets/images/movie.png"),
  cardinfo(5,
      text: "Religion",
      image: "assets/images/praying.png")

];
final List<Widget> screenslist = [
  
    ];
