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
  image: "images/alphabetical.png"),
  cardinfo(2,
      text: "Puzzle",
      image: "images/puzzle.png"),
  cardinfo(3,
      text: "Painting",
      image: "images/paint (1).png"),
  cardinfo(4,
      text: "Stories",
      image: "images/movie.png"),
  cardinfo(5,
      text: "Religion",
      image: "images/praying.png")

];
final List<Widget> screenslist = [
  
    ];
