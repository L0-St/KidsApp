import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti/puzzle/sub_screens/puzzle/sub_screens/letters_puzzle.dart';
import 'package:iti/puzzle/sub_screens/puzzle/sub_screens/numbers_puzzle.dart';

import '../../../main_screen/homepuzzle.dart';
import '../sub_screens/shapes_puzzle.dart';

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
          height: MediaQuery.sizeOf(context).height*0.13,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 242, 238, 244),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Image.asset(
                image,
                height: MediaQuery.sizeOf(context).height*0.1,
                width: MediaQuery.sizeOf(context).width*0.17,
              ),
              SizedBox(
                width:MediaQuery.sizeOf(context).width*0.045,
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
        leading: Row(
          children: [
            // IconButton(
            //     onPressed: () {
            //       Navigator.pop(context,
            //           MaterialPageRoute(builder: (BuildContext) => MainScreen()));
            //     },
            //     icon: Icon(
            //       CupertinoIcons.arrow_left,
            //       color: Colors.white,
            //     ),
            // ),
            Container(
                padding: EdgeInsets.only(left: 10),
                height: 50,
                width: 50,
                child: Image.asset("assets/images/daycare.png")),
          ],
        ),
        title: Text(
          "Puzzles",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildContainer(
              image: "assets/images/abc.png",
              text: "Connect each letter \nto the appropriate word ",
              newScreen: LettersPuzzle(),
            ),
            _buildContainer(
              image: "assets/images/numbers.png",
              text: "Connect each number \nto the appropriate word ",
              newScreen: NumbersPuzzle(),
            ),
            _buildContainer(
              image: "assets/images/shapes.png",
              text: "Connect each shape \nto the appropriate word ",
              newScreen: ShapesPuzzle(),
            ),
          ],
        ),
      ),
    );
  }
}
