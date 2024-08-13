import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Alphabets extends StatefulWidget {
  const Alphabets({Key? key}) : super(key: key);

  @override
  State<Alphabets> createState() => _HomePageState();
}

class _HomePageState extends State<Alphabets> {
  final List<String> urls = [
    "https://youtu.be/vD98OvvDNEs",
    "https://youtu.be/Tu_VH-VxvO8",
    "https://youtu.be/Ptu2eMCP-8A",
    "https://youtu.be/877J5pVyqiU",
    "https://youtu.be/p-0cBccTRHA",
    "https://youtu.be/dcXhxFnvXEo",
    "https://youtu.be/ZaaKFPcBDxI",
  ];

  final List<String> videoDescriptions = [
    "The Alphabet Song",
    "Learn Letters a to z with Pratfall ABCs",
    "Noodle & Pals ABCs",
    "Coloring Letters Arabic Alphabet Learning For Children and Kids",
    "Arabic Alphabet Song",
    "Learn The Arabic Alphabet | Alif Ba ta | For kids",
    "Alif Ba Ta For Children Arabic Alphabet Song"
  ];

  final List<String> img = [
    "assets/images/duck.webp",
    "assets/images/abc.jpeg",
    "assets/images/xyz.jpeg",
    "assets/images/ara.jpeg",
    "assets/images/arb1.jpeg",
    "assets/images/as.jpeg",
    "assets/images/girl.webp",
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
        backgroundColor: Color.fromARGB(221, 214, 111, 209),
        title: Text(
          "Alphabets",
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
                  child: Image.asset('assets/images/Rectangle 6.png'),
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
              "Learn Alphabets?",
              style: TextStyle(
                color: Color.fromARGB(221, 214, 111, 209),
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
        backgroundColor: Color.fromARGB(221, 214, 111, 209),
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
