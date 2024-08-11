import 'package:flutter/material.dart';
import 'package:iti/alphabet.dart';
import 'package:iti/draw.dart';
import 'package:iti/homepuzzle.dart';
import 'package:iti/islamic.dart';
import 'package:iti/learn1.dart';
import 'package:iti/story.dart';
import 'package:iti/storydetail.dart';
import 'package:iti/themebutton.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0, top: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: Image.asset('images/kid1.png'),
                    ),
                    Spacer(),  // Use Spacer() to push the IconButton to the end
                    IconButton(
                      onPressed: () {
                         
                  /* Navigator.push(context,
                   MaterialPageRoute(
                    builder: (context) =>Themebutton(),
                  ),
                  
                  );*/
                  
                  },
                      
                      icon: Icon(
                        Icons.settings,
                        color: Color.fromARGB(255, 176, 136, 183),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 290.0),
                child: Text(
                  "Hello Kids",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromARGB(255, 176, 136, 183),
                  ),
                ),
              ),
              SizedBox(height: 20),
             Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                      InkWell(
                        onTap: (){
                          Navigator.push(context,
                   MaterialPageRoute(
                    builder: (context) =>MyWidget(),
                  ),
                  
                  );
                        },
                        
                        child: Image.asset('images/letters.png', width: 250, height: 210)),
                       InkWell(
                        onTap: (){
                          Navigator.push(context,
                   MaterialPageRoute(
                    builder: (context) =>MainScreen(),
                  ),
                  
                  );
                        },
                        
                        child: Image.asset('images/puz.png', width: 250, height: 210)),
                  
                    
                ],
              ),
             
               SizedBox(height: 40),
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                      InkWell(
                         onTap: (){
                          Navigator.push(context,
                   MaterialPageRoute(
                    builder: (context) =>Draw(),
                  ),
                  
                  );
                        },
                        child: Image.asset('images/paint.png', width: 250, height: 210)),
                           InkWell(
                              onTap: (){
                          Navigator.push(context,
                   MaterialPageRoute(
                    builder: (context) =>Story(),
                  ),
                  
                  );
                        },
                            child: Image.asset('images/stories.png', width: 250, height: 210)),
                      
                    
                ],
              ),
              SizedBox(height: 40),
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                      InkWell(
                         onTap: (){
                          Navigator.push(context,
                   MaterialPageRoute(
                    builder: (context) =>Islamic(),
                  ),
                  
                  );
                        },
                        
                        child: Image.asset('images/religion.png', width: 250, height: 210)),
                           
                    
                ],
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}


