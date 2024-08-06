import 'package:flutter/material.dart';
import 'package:iti/second.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // صورة الخلفية التي تغطي الشاشة بأكملها
          Positioned.fill(
            child: Image.asset(
              'images/first1.png',
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
                    builder: (context) =>Second(),
                  ),
                  
                  );
                  
                  },
              child: Image.asset(
                'images/continue.png',
                fit: BoxFit.contain,
                 width: 300,
                 height: 130,// الحفاظ على شكل الصورة
              ),
            ),
          ),
        ],
      ),
    );
  }
}