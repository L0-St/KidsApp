import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti/alphabet.dart';
import 'package:iti/animal.dart';
import 'package:iti/home1.dart';
import 'package:iti/number.dart';
import 'package:iti/shape.dart';

class MyWidget extends StatelessWidget {
  //const MyWidget({super.key});
 final List<String> images = [
    'images/Group 3.png',
    'images/Group 8.png',
    'images/Group 9.png',
    // أضف المزيد من الروابط هنا
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
          Stack(
            children: 
          [
          
          Image.asset('images/Group 1.png'),
          IconButton(onPressed: (){
             Navigator.pop(context,
                 MaterialPageRoute(
                  builder: (context) => Home(),
                ),

                );
          }, icon: Icon(CupertinoIcons.arrow_left,color: Colors.white,))
          ]),
          SizedBox(height: 30,),
          Expanded(
            
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
              InkWell(
                onTap: (){
               Navigator.push(context,
                 MaterialPageRoute(
                  builder: (context) =>Alphabets(),
                ),

                );

                },
                child: Image.asset( 'images/Group 3.png',width: 400,height: 150,),
              ),
                  SizedBox(height: 30,),
              InkWell(
                onTap: (){
                 Navigator.push(context,
                 MaterialPageRoute(
                  builder: (context) => Numbers(),
                ),

                );

                },
                child: Image.asset( 'images/Group 8.png',width: 400,height: 150,),
              ),
               SizedBox(height: 30,),
              InkWell(
                onTap: (){
                Navigator.push(context,
                 MaterialPageRoute(
                  builder: (context) => Shapes(),
                ),

                );

                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 80.0),
                  child: Image.asset( 'images/Group x.png',width: 600,height: 200,),
                ),
              ),
               SizedBox(height: 30,),
              InkWell(
                onTap: (){
                 Navigator.push(context,
                 MaterialPageRoute(
                  builder: (context) => Animals(),
                ),

                );

                },
                child: Image.asset( 'images/animal.png',width: 360,height: 100,),
              ),



                ],
              ),



          ))



          ],
        ),
      ),
    );
  }
}