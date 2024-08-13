import 'package:flutter/material.dart';

import '../widgets/onboarding_screen.dart';
import 'third.dart';

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(image: "assets/images/second.png",nextScreen: Third(),);
  }
}