import 'package:flutter/material.dart';

import '../onboarding/second.dart';

class OnboardingScreen extends StatelessWidget {
   OnboardingScreen({super.key,required this.image,required this.nextScreen});
  String image;
  Widget nextScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // صورة الخلفية التي تغطي الشاشة بأكملها
          Positioned.fill(
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
          // الصورة الموجودة في أسفل الشاشة
          Positioned(
            bottom: 70, // وضع الصورة في أسفل الشاشة
            left: 0,
            right: 0,
            child: InkWell(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) =>nextScreen,
                  ),

                );

              },
              child: Image.asset(
                'assets/images/continue.png',
                fit: BoxFit.contain,
                width: MediaQuery.sizeOf(context).width*0.3,
                height: MediaQuery.sizeOf(context).height*0.14,// الحفاظ على شكل الصورة
              ),
            ),
          ),
        ],
      ),
    );
  }
}
