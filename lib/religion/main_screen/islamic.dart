import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iti/religion/sub_screens/ablution_screen/ablution.dart';
import 'package:iti/religion/sub_screens/azkar_screen/azkar.dart';
import 'package:iti/home/home1.dart';
import 'package:iti/religion/sub_screens/moral_screen/moral.dart';
import 'package:iti/religion/sub_screens/prayer_screen/prayer.dart';
import 'package:iti/religion/sub_screens/quran_screen/qran.dart';

class Islamic extends StatelessWidget {
  const Islamic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4,top: 30,right: 400.0),
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
                  color: Color.fromARGB(255, 213, 180, 155),
                )),
          ),
          Image.asset(
            'assets/images/mosq.png',
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height*0.022,
          ),
          Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 150.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Azkar(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/azkar.png',
                          width: MediaQuery.sizeOf(context).width*0.7,
                          height: MediaQuery.sizeOf(context).height*0.338,
                        ),
                      ),
                    ),
                    //SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 150.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Ablution(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/Group 5.png',
                          width: MediaQuery.sizeOf(context).width*0.7,
                          height: MediaQuery.sizeOf(context).height*0.338,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 150.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Prayer(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/Group 17.png',
                          width: MediaQuery.sizeOf(context).width*0.7,
                          height: MediaQuery.sizeOf(context).height*0.338,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 150.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Moral(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/Group 20.png',
                          width: MediaQuery.sizeOf(context).width*0.7,
                          height: MediaQuery.sizeOf(context).height*0.338,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 150.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Quran(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/Group 22.png',
                          width: MediaQuery.sizeOf(context).width*0.7,
                          height: MediaQuery.sizeOf(context).height*0.338,
                        ),
                      ),
                    ),
                  ])))
        ],
      ),
    );
  }
}
