import 'package:flutter/material.dart';
import 'package:iti/home/home1.dart';
import 'package:iti/onboarding/first.dart';

import '../helpers/hive_helper.dart';
import '../login/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 193, 220),
      body: Center(
        child: Image.asset(
          "assets/images/rabbit.png",
          height: MediaQuery.sizeOf(context).height*0.15,
          width: MediaQuery.sizeOf(context).width*0.5,
        ),
      ),
    );
  }


  @override
  void initState() {
    final token = HiveHelper.getToken();
    print("===================" + HiveHelper.getToken.toString());
    Future.delayed(
      const Duration(seconds: 3),
          () => ( token == null)  ? Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          First()), (Route<dynamic> route) => false): Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          Home()), (Route<dynamic> route) => false),
    );
    super.initState();
  }
}
