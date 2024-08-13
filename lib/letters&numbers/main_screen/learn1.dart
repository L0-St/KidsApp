import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti/letters&numbers/sub_screens/alphabet_screen/alphabet.dart';
import 'package:iti/letters&numbers/sub_screens/animal_screen/animal.dart';
import 'package:iti/home/home1.dart';
import 'package:iti/letters&numbers/sub_screens/number_screen/number.dart';
import 'package:iti/letters&numbers/sub_screens/shape_screen/shape.dart';

class MyWidget extends StatelessWidget {
  //const MyWidget({super.key});
  final List<String> images = [
    'assets/images/Group 3.png',
    'assets/images/Group 8.png',
    'assets/images/Group 9.png',
    // أضف المزيد من الروابط هنا
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(children: [
              Image.asset('assets/images/Group 1.png'),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    },
                    icon: Icon(
                      CupertinoIcons.arrow_left,
                      color: Colors.white,
                    )),
              )
            ]),
            SizedBox(
              height: MediaQuery.sizeOf(context).height*0.025,
            ),
            Expanded(
                child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  _buildContainer1(context,
                      image: 'assets/images/Group 3.png',
                      nextScreen: Alphabets()),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height*0.025,
                  ),
                  _buildContainer1(context,
                      image: 'assets/images/Group 8.png',
                      nextScreen: Numbers()),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height*0.025,
                  ),
                  _buildContainer1(context,
                      image: 'assets/images/Group x.png', nextScreen: Shapes()),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height*0.025,
                  ),
                  _buildContainer1(context,
                      image: 'assets/images/animal.png', nextScreen: Animals()),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  InkWell _buildContainer1(BuildContext context,
      {required String image, required Widget nextScreen}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => nextScreen,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0, right: 25, left: 25),
        child: Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.1,
          child: Image.asset(
            image,
            // width: 400,
            // height: 150,
          ),
        ),
      ),
    );
  }
}
