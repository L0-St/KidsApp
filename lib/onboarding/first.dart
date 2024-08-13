import 'package:flutter/material.dart';
import 'package:iti/widgets/onboarding_screen.dart';

import 'second.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(image: "assets/images/first.png",nextScreen: Second(),);
  }
}

