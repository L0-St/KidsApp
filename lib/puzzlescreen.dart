import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti/homepuzzle.dart';
import 'package:iti/letters_puzzle.dart';
import 'package:iti/numbers_puzzle.dart';
import 'package:iti/shapes_puzzle.dart';


class PuzzleScreen extends StatelessWidget {
  const PuzzleScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Widget _buildContainer(
        {required String image,
          required String text,
          required Widget newScreen}) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (BuildContext) => newScreen));
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 242, 238, 244), borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Image.asset(
                image,
                height: 70,
                width: 70,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      );
    }


    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 193, 220),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 166, 99, 195),
        leading: IconButton(onPressed: (){
              Navigator.pop(
              context, MaterialPageRoute(builder: (BuildContext) => MainScreen()));
            }, icon: Icon(CupertinoIcons.arrow_left,color: Colors.white,)),
        actions:[ Container(
            padding: EdgeInsets.only(left: 10),
            height: 20,
            width: 20,
            child: Image.asset("images/daycare.png")
        ),],
        title: Text("Puzzles",style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildContainer(
                image: "images/abc.png",
                text: "Connect each letter to the \n appropriate word ",
                newScreen: LettersPuzzle(),
            ),
            _buildContainer(
              image: "images/numbers.png",
              text: "Connect each number to the\n appropriate word ",
              newScreen: NumbersPuzzle(),
            ),
            _buildContainer(
              image: "images/shapes.png",
              text: "Connect each shape to the \n appropriate word ",
              newScreen: ShapesPuzzle(),
            ),
          ],
        ),
      ),
    );

  }

}
