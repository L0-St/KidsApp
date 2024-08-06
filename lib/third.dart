import 'package:flutter/material.dart';
import 'package:iti/home1.dart';
import 'package:iti/second.dart';

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // صورة الخلفية التي تغطي الشاشة بأكملها
          Positioned.fill(
            child: Image.asset(
              'images/third.png',
              fit: BoxFit.fill,
            ),
          ),
          // الصورة الموجودة في أسفل الشاشة
          Positioned(
            bottom: 50, // وضع الصورة في أسفل الشاشة
            left: 0,
            right: 0,
            child: InkWell(
               onTap: (){
                   Navigator.push(context,
                   MaterialPageRoute(
                    builder: (context) =>Home(),
                  ),
                  
                  );
                  
                  },
              child: Image.asset(
                 'images/continue.png',
                  width: 300,
                 height: 130,
                fit: BoxFit.contain, // الحفاظ على شكل الصورة
              ),
            ),
          ),
        ],
      ),
    );
  }
}