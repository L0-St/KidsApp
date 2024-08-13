import 'package:flutter/material.dart';
import 'package:iti/login/login_screen/login_screen.dart';

import '../helpers/hive_helper.dart';
import '../home/home1.dart';
import '../widgets/onboarding_screen.dart';

class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      image: "assets/images/third.png",
      nextScreen: LoginScreen(),
    );
  }

}
