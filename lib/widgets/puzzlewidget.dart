import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:iti/puzzle/model/itemmodel.dart';

class PuzzleWidget extends StatefulWidget {
  PuzzleWidget({this.imagesList, this.wordsList});
  List? imagesList;
  List? wordsList;
  // List? valuesList;

  @override
  State<PuzzleWidget> createState() => _PuzzleWidgetState();
}

class _PuzzleWidgetState extends State<PuzzleWidget> {
  late List<ItemModel?> acceptedItems;
  late List receivedItems;
  late List<ItemModel> items;
  late List<ItemModel> items2;
  late int score;
  late int endScore;
  late bool endGame;
  int numberOfAttempts = 3;

  initGame() {
    endGame = false;
    score = 0;
    numberOfAttempts = 3;
    endScore = widget.imagesList!.length * 10;
    items = [
      for (int i = 0; i < widget.imagesList!.length; i++)
        ItemModel(
          name: widget.wordsList![i],
          image: widget.imagesList![i],
        )
    ];

    // Take copy from items
    items2 = List<ItemModel>.from(items);

    // make the list random
    items.shuffle();
    items2.shuffle();
  }

  @override
  void initState() {
    initGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 166, 99, 195),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/heart.png",
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "$numberOfAttempts",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
          ),
        ],
        title: Text(
          "Score = $score",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Column(
              children: items.map((item) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  child: Draggable<ItemModel>(
                    data: item,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5.5),
                      height: MediaQuery.sizeOf(context).height * 0.0562,
                      width: MediaQuery.sizeOf(context).width * 0.12,
                      child: Image.asset(item.image!),
                    ),
                    feedback: Container(
                      height: MediaQuery.sizeOf(context).height * 0.0562,
                      width: MediaQuery.sizeOf(context).width * 0.12,
                      child: Image.asset(item.image!),
                    ),
                  ),
                );
              }).toList(),
            ),
            Spacer(),
            Column(
              children: items2.map((item) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: DragTarget<ItemModel>(
                      onAccept: (receivedItem) {
                        if (item.name == receivedItem.name) {
                          if (numberOfAttempts != 0) {
                            score += 10;
                          }
                          item.accepting = false;

                          setState(() {
                            if (numberOfAttempts != 0) {
                              items.remove(receivedItem);
                              items2.remove(item);
                            }
                            if (items.isEmpty) {
                              showAlertDialog(context,
                                  message: "Congratulations",
                                  playAgain: "New Game");
                              endGame = true;
                            }
                          });
                        } else {
                          setState(() {
                            if (numberOfAttempts > 0) {
                              numberOfAttempts--;
                            }
                            // if (items.isEmpty) {
                            //   showAlertDialog(context,message: "Congratulations",playAgain: "New Game");
                            //   endGame = true;
                            // }
                            if (numberOfAttempts == 0) {
                              showAlertDialog(context,
                                  message: "Game Over", playAgain: "Try again");
                            }
                          });
                          item.accepting = false;
                        }
                      },
                      onWillAccept: (receivedItem) {
                        setState(() {
                          item.accepting = true;
                        });
                        // must return true to work this function
                        return true;
                      },
                      onLeave: (receivedItem) {
                        setState(() {
                          item.accepting = false;
                        });
                      },
                      builder: (context, acceptedItems, receivedItems) =>
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                 horizontal: 3,vertical: 10),
                            height: MediaQuery.sizeOf(context).height*0.0449,
                            width: MediaQuery.sizeOf(context).width*0.33,
                            decoration: BoxDecoration(
                              color: item.accepting
                                  ? Colors.blue
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              item.name!,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          )),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Widget showMessage({
  //   required String message,
  //   required String playAgain,
  // }) {
  //   return Container(
  //     height: 100,
  //     width: 300,
  //     decoration: BoxDecoration(
  //     color: Colors.grey[300],
  //       borderRadius:BorderRadius.circular(15),
  //     ),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         SizedBox(height: 8,),
  //         Text(
  //           message,
  //           style: TextStyle(fontSize: 30),
  //         ),
  //         Spacer(),
  //         Padding(
  //           padding: const EdgeInsets.all(10.0),
  //           child: Row(
  //             children: [
  //               Spacer(),
  //               InkWell(
  //                 onTap: () {
  //                   initGame();
  //                   setState(() {});
  //                 },
  //                 child: Text(
  //                   playAgain,
  //                   style: TextStyle(color: Colors.red),
  //                 ),
  //               ),
  //               SizedBox(
  //                 width: 16,
  //               ),
  //               InkWell(
  //                 onTap: (){
  //                   Navigator.pop(context);
  //                 },
  //                   child: Text("back"),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  showAlertDialog(
    BuildContext context, {
    required String message,
    required String playAgain,
  }) {
    // set up the button
    Widget okButton = TextButton(
      child: Text(playAgain),
      onPressed: () {
        initGame();
        setState(() {});
        Navigator.pop(context);
      },
    );
    Widget backButton = TextButton(
      child: Text("back"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Center(
          child: Text(
        message,
        style: TextStyle(fontSize: 30),
      )),
      // content: Text("This is my message."),
      actions: [
        okButton,
        backButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
