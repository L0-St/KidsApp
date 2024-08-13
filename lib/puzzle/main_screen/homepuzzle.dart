import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti/home/home1.dart';
import 'package:iti/puzzle/sub_screens/puzzle/puzzle_screen/puzzlescreen.dart';

import '../sub_screens/learning/learning_screen/learningscreen.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Image.asset(
                image,
                height: MediaQuery.sizeOf(context).height*0.1,
                width: MediaQuery.sizeOf(context).width*0.16,
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
        backgroundColor:  Color.fromARGB(255, 166, 99, 195),
        leading: Row(
          children: [
            IconButton(onPressed: (){
              Navigator.pop(
              context, MaterialPageRoute(builder: (BuildContext) => Home()));
            }, icon: Icon(CupertinoIcons.arrow_left,color: Colors.white,)),
            /*Container(
                padding: EdgeInsets.only(left: 10),
                height: 10,
                width: 10,
                child: Image.asset("images/gamespace.png",color: Colors.white,)
            ),*/
          ],
        ),
        title: Text("Game Space",style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildContainer(
              image: "assets/images/learning.png",
              text: "Learning",
              newScreen: LearningScreen(),
            ),
            _buildContainer(
              image: "assets/images/daycare.png",
              text: "Puzzles",
              newScreen: PuzzleScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
