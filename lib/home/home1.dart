import 'package:flutter/material.dart';
import 'package:iti/letters&numbers/sub_screens/alphabet_screen/alphabet.dart';
import 'package:iti/religion/main_screen/islamic.dart';
import 'package:iti/letters&numbers/main_screen/learn1.dart';
import 'package:iti/stories/story_screen/story.dart';
import 'package:iti/stories/sub_screens/storydetail.dart';
import 'package:iti/theme/themebutton.dart';

import '../paint/draw_screen/draw.dart';
import '../puzzle/main_screen/homepuzzle.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 30),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: Image.asset('assets/images/boy.png'),
                    ),
                    Spacer(), // Use Spacer() to push the IconButton to the end
                    IconButton(
                      onPressed: () {
                        /* Navigator.push(context,
                   MaterialPageRoute(
                    builder: (context) =>Themebutton(),
                  ),

                  );*/
                      },
                      icon: Icon(
                        Icons.settings,
                        color: Color.fromARGB(255, 176, 136, 183),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Kids",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color.fromARGB(255, 176, 136, 183),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.06,
              ),
              _buildRow(context,
                  screen1: MyWidget(),
                  image1: "assets/images/letters.png",
                  screen2: MainScreen(),
                  image2: 'assets/images/puz.png'),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.06,
              ),
              _buildRow(context,
                  screen1: Draw(),
                  image1: 'assets/images/paint.png',
                  screen2: Story(),
                  image2: 'assets/images/stories.png'),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Islamic(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/religion.png',
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        height: MediaQuery.sizeOf(context).height * 0.2,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildRow(BuildContext context,
      {required Widget screen1,
      required String image1,
      String? image2,
      Widget? screen2}) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // TODO : Diff
                  builder: (context) => screen1,
                ),
              );
            },
            // TODO : Diff
            child: Image.asset(
              image1,
              width: MediaQuery.sizeOf(context).width * 0.5,
              height: MediaQuery.sizeOf(context).height * 0.2,
            )),
        InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // TODO : Diff
                  builder: (context) => screen2!,
                ),
              );
            },
            // TODO : Diff
            child: Image.asset(image2!,
                width: MediaQuery.sizeOf(context).width * 0.5,
                height: MediaQuery.sizeOf(context).height * 0.2)),
      ],
    );
  }
}
