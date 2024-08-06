import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Shapes extends StatefulWidget {
  const Shapes({Key? key}) : super(key: key);

  @override
  State<Shapes> createState() => _HomePageState();
}

class _HomePageState extends State<Shapes> {
  final List<String> urls = [
    "https://youtu.be/o-6OKWU99Co",
    "https://youtu.be/KvYh1e93BII",
    "https://youtu.be/8Bh99CBcpe8",
    "https://youtu.be/X5e26QxffEA",
    "https://youtu.be/KEZ1DIy33q0",
    "https://youtu.be/RXs_lCpaACg",
   
  ];

  final List<String> videoDescriptions = [
    "Shapes learning for kids",
    "Learn Shapes with Colors",
    "The Shapes Song, Preschool Video and Learning Song for Kids",
    "Learn Shapes in Arabic for Children",
    "Learn arabic (shapes) – Apprendre l’arabe (les formes)",
    "Learn Shapes in Arabic for Kids",
    
  ];

  final List<String> img = [
    "images/sh1.jpeg",
    "images/sh2.jpeg",
    "images/sh3.jpeg",
     "images/sh4.jpeg",
    "images/sh5.jpeg",
    "images/sh6.jpeg",
    
  ];

  late List<YoutubePlayerController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = urls.map<YoutubePlayerController>((url) {
      String? id = YoutubePlayer.convertUrlToId(url);
      return YoutubePlayerController(
        initialVideoId: id!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(221, 228, 60, 161),
        title: Center(
          child: Text(
            "Shapes",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Icon(CupertinoIcons.bell),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Container(
                    width: 400,
                    height: 300,
                    decoration: BoxDecoration(color:  Color.fromARGB(221, 236, 158, 204),borderRadius: BorderRadius.circular(30)),
                    child: Image.asset('images/shape2.png',)),
                ),
                SizedBox(height: 10),
                
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Learn Shapes?",
              style: TextStyle(
                color:Color.fromARGB(221, 228, 60, 161),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _controllers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            img[index],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _controllers[index].metadata.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Center(
                                child: Text(
                                  videoDescriptions[index],
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 63, 60, 60),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPage(
                          controller: _controllers[index],
                          description: videoDescriptions[index],
                          nextController: index < _controllers.length - 1 ? _controllers[index + 1] : null,
                          previousController: index > 0 ? _controllers[index - 1] : null,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class VideoPage extends StatelessWidget {
  final YoutubePlayerController controller;
  final String description;
  final YoutubePlayerController? nextController;
  final YoutubePlayerController? previousController;

  const VideoPage({
    Key? key,
    required this.controller,
    required this.description,
    this.nextController,
    this.previousController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.metadata.title),
        backgroundColor: Color.fromARGB(221, 228, 60, 161),
        iconTheme: IconThemeData(color: Colors.white),
      
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: YoutubePlayer(
              controller: controller,
              showVideoProgressIndicator: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                
          IconButton(
            icon: Icon(Icons.skip_previous),
            onPressed: previousController != null
                ? () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPage(
                          controller: previousController!,
                          description: description,
                          nextController: controller,
                          previousController: null,
                        ),
                      ),
                    );
                  }
                : null,
          ),
          IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: () {
              controller.play();
            },
          ),
          IconButton(
            icon: Icon(Icons.skip_next),
            onPressed: nextController != null
                ? () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPage(
                          controller: nextController!,
                          description: description,
                          nextController: null,
                          previousController: controller,
                        ),
                      ),
                    );
                  }
                : null,
          ),
        ],
            
          )
        ],
      ),
    );
  }
}