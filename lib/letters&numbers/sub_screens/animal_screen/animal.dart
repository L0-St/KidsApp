import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Animals extends StatefulWidget {
  const Animals({Key? key}) : super(key: key);

  @override
  State<Animals> createState() => _HomePageState();
}

class _HomePageState extends State<Animals> {
  final List<String> urls = [
    "https://youtu.be/ytBFWu_uZvQ",
    "https://youtu.be/x-3dL8UFoas",
    "https://youtu.be/gXKiYdErMu0",
    "https://youtu.be/ndvjlGtIR3E",
    "https://youtu.be/dmAb6XbJmF8",
    "https://youtu.be/fmbVBIiO1k0",
  ];

  final List<String> videoDescriptions = [
    "Sounds of Wild Animals at the Zoo for Children to Learn",
    "Animals At The Zoo - 2 | Learning About Zoo Animals | Vocabulary video for kids",
    "Zoo animals Names and Sounds",
    "Learn arabic (wild animals)",
    "Aquatic Animals for Kids in Arabic ",
    "Arabic Alphabet for Kids with Animals",
  ];

  final List<String> img = [
    "assets/images/an1.jpeg",
    "assets/images/an2.jpeg",
    "assets/images/an3.jpeg",
    "assets/images/an4.jpeg",
    "assets/images/an5.jpeg",
    "assets/images/an6.jpeg",
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
        backgroundColor: Color.fromARGB(221, 152, 209, 234),
        title: Text(
          "Animals",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(CupertinoIcons.bell),
          ),
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
                  padding: const EdgeInsets.only(top: 20.0,right: 25),
                  child: Image.asset(
                    'assets/images/animals.png',
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height*0.015,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height*0.015,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Learn Animals?",
              style: TextStyle(
                color: Color.fromARGB(221, 152, 209, 234),
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
                            width: MediaQuery.sizeOf(context).height*0.1,
                            height: MediaQuery.sizeOf(context).width*0.2,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: MediaQuery.sizeOf(context).width*0.09),
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
                              Text(
                                videoDescriptions[index],
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 63, 60, 60),
                                  fontSize: 14,
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
                          nextController: index < _controllers.length - 1
                              ? _controllers[index + 1]
                              : null,
                          previousController:
                              index > 0 ? _controllers[index - 1] : null,
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
        backgroundColor: Color.fromARGB(221, 152, 209, 234),
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
          SizedBox(
            height: MediaQuery.sizeOf(context).height*0.02,
          ),
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
