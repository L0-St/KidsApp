import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iti/first.dart';



bool isActive = true;
class SplashScreen extends StatefulWidget {
  final bool? secondSplash;
  const SplashScreen({this.secondSplash = true, super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  @override
  void initState() {
    const oneSec = Duration(milliseconds: 300);
     if (isActive) {
       timer = Timer.periodic(oneSec, (Timer t) {
         Navigator.pushAndRemoveUntil(
           context,
           MaterialPageRoute(
               builder: (context) =>
                   SplashScreen(
                     secondSplash: !widget.secondSplash!,
                   )),
               (Route<dynamic> route) => false,
         );
       });
     }

     isActive = false;
     if (!isActive) {
       timer!.cancel();
      Future.delayed(Duration(seconds: 5))
          .then((v) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => First()),
            (Route<dynamic> route) => false,
      ));
     }

    super.initState();
  }

  @override
  Widget  build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children:[
          Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height,
          child: Image.asset(widget.secondSplash! ?
          "images/rabbit.png" :
          "images/splash2.jpg",
            
            fit: BoxFit.cover,
          ),
        ),
    Padding(
    padding: const EdgeInsets.only(
    top: 100.0, left: 20, bottom: 20, right: 20),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [Center(
      child:Text(
    "Kiddy Time",
    style: TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    ),
    ),)
      ]
      ),

    )
        ]
    )
    );

  }
}
