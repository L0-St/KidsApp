import 'package:flutter/material.dart';
import 'package:iti/helpers/cons.dart';



class LettersScreen extends StatefulWidget {
  LettersScreen({super.key});

  @override
  State<LettersScreen> createState() => _LettersScreenState();
}

class _LettersScreenState extends State<LettersScreen> {
  bool isPressed = false;
  int? index;

  @override
  Widget build(BuildContext context) {

    ///F9F3F0FF
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 193, 220),
      body: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height*0.033,
              ),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 40,
                ),
              ),
              Text(
                "Letters",
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height:  MediaQuery.sizeOf(context).height*0.015,
              ),
              Text(
                "Match the correct \nAlphabet Letter by\nplaceing it on the\nscreen ",
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.65),
                    fontSize: 19,
                ),
              ),
              SizedBox(
                height:  MediaQuery.sizeOf(context).height*0.01,
              ),
              if (isPressed)
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 120),
                      child: Image.asset(lettersImage[index!],
                        height:  MediaQuery.sizeOf(context).height*0.26,
                        width: MediaQuery.sizeOf(context).width * 0.5,
                      ),
                    ),
                    Text(
                      "( ${lettersList[index!]} = ${wordsList[index!]} )",
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.grey,
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "( ${lettersList[index!]}",style: TextStyle(
                    //       fontSize: 30,
                    //       color: (index!%2==0)?Color(0xFFFD896B):Color(0xFF02CC9E),
                    //     ),
                    //     ),
                    //     Text(
                    //       " = ",style: TextStyle(
                    //       fontSize: 30,
                    //       color: Colors.grey,
                    //     ),
                    //     ),
                    //     Text(
                    //       "${wordsList[index!]} )",style: TextStyle(
                    //       fontSize: 30,
                    //       color: (index!%2==0)?Color(0xFF8258C7):Color(0xFF00F8FD),
                    //     ),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
            ]),
            Spacer(),
            Container(
              color: Colors.white,
              width: 150,
              child: ListView.separated(
                  itemBuilder: (c, i) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {
                                index = i * 2;
                                isPressed = true;
                                setState(() {});
                              },
                              child: Image.asset(
                                lettersImage[i * 2],
                                height: MediaQuery.sizeOf(context).height*0.045,
                                width: MediaQuery.sizeOf(context).width*0.1,
                              )),
                          InkWell(
                            onTap: () {
                              index = i * 2 + 1;
                              isPressed = true;
                              setState(() {});
                            },
                            child: Image.asset(
                              lettersImage[i * 2 + 1],
                              height: MediaQuery.sizeOf(context).height*0.045,
                              width: MediaQuery.sizeOf(context).width*0.1,
                            ),
                          ),
                        ],
                      ),
                  separatorBuilder: (c, i) => SizedBox(
                        height: MediaQuery.sizeOf(context).height*0.03,
                      ),
                  itemCount: lettersList.length ~/ 2),
            ),
          ],
        ),
      ),
    );
  }
}