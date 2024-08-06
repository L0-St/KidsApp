import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iti/ablution.dart';
import 'package:iti/azkar.dart';
import 'package:iti/home1.dart';
import 'package:iti/moral.dart';
import 'package:iti/prayer.dart';
import 'package:iti/qran.dart';

class Islamic extends StatelessWidget {
  const Islamic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: Column(
    children: [
      
        Padding(
          padding: const EdgeInsets.only(right: 400.0),
          child: IconButton(onPressed: (){
               Navigator.pop(context,
                   MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
          
                  );
            }, icon: Icon(CupertinoIcons.arrow_left,color: Color.fromARGB(255, 213, 180, 155),)),
        ),
        
             Image.asset('images/mosq.png',fit: BoxFit.fill,),
             SizedBox(height: 20,),
             Expanded(
            
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
             Padding(
               padding: const EdgeInsets.only(right:150.0),
               child: InkWell(
                 onTap: (){
                   Navigator.push(context,
                   MaterialPageRoute(
                    builder: (context) =>Azkar (),
                  ),
                  
                  );
                  
                  },
                  child: Image.asset('images/azkar.png',width: 600,height: 300,),
               ),
             ),
                  //SizedBox(height: 10,),
                   Padding(
                     padding: const EdgeInsets.only(left:150.0),
                     child: InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                      MaterialPageRoute(
                                       builder: (context) =>Ablution (),
                                     ),
                                     
                                     );
                                     
                                     },
                                     child: Image.asset('images/Group 5.png',width: 600,height: 300,),
                                  ),
                   ),
                   Padding(
               padding: const EdgeInsets.only(right:150.0),
               child: InkWell(
                 onTap: (){
                   Navigator.push(context,
                   MaterialPageRoute(
                    builder: (context) =>Prayer (),
                  ),
                  
                  );
                  
                  },
                  child: Image.asset('images/Group 17.png',width: 600,height: 300,),
               ),
             ),
             Padding(
                     padding: const EdgeInsets.only(left:150.0),
                     child: InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                      MaterialPageRoute(
                                       builder: (context) =>Moral (),
                                     ),
                                     
                                     );
                                     
                                     },
                                     child: Image.asset('images/Group 20.png',width: 600,height: 300,),
                                  ),
                   ),
                    Padding(
               padding: const EdgeInsets.only(right:150.0),
               child: InkWell(
                 onTap: (){
                   Navigator.push(context,
                   MaterialPageRoute(
                    builder: (context) =>Quran(),
                  ),
                  
                  );
                  
                  },
                  child: Image.asset('images/Group 22.png',width: 600,height: 300,),
               ),
             ),
                ])
          ))
           
      
    ],
   ),






    );
  }
}