import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Prayer extends StatefulWidget {
  const Prayer({Key? key}) : super(key: key);

  @override
  State<Prayer> createState() => _AblutionState();
}

class _AblutionState extends State<Prayer> {
  final List<String> urls = [
    "https://youtu.be/edL3W38ODd4",
    "https://youtu.be/v5ysvdDEMvs",
    "https://youtu.be/arKQc4M-epA",
  ];

  final List<String> videoDescriptions = [
  "تعلم كيفية الصلاة مع زكريا | تعليم الصلاة للاطفال بطريقة سهلة - كارتون تعليم الصلاة للاطفال",
    "تعلم كيفية الصلاة مع حمزه | تعليم الصلاة للاطفال بطريقة سهلة - كارتون تعليم الصلاة للاطفال",
    "تعلم كيفية الصلاة للأطفال | تعليم الصلاة للاطفال بطريقة سهلة"
  ];

  final List<String> img = [
    'images/th (3).jpeg',
    'images/th (4).jpeg',
    'images/th (5).jpeg',
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
        backgroundColor: Color.fromARGB(255, 207, 183, 177),
        title: Center(
          child: Text(
            "Ablution",
            style: TextStyle(
              color: Color.fromARGB(255, 248, 247, 246),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset('images/Group 18.png', width: 650, height: 350),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "اليك التوضيح بالصور",
                style: TextStyle(
                  color: Color.fromARGB(255, 207, 183, 177),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                 Image.asset('images/prayer.jpg'),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text("فيديو للتوضيح",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Color.fromARGB(255, 207, 183, 177),),),
            SizedBox(height: 15),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
          ],
        ),
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
        backgroundColor: Color.fromARGB(255, 207, 183, 177),
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
          SizedBox(height: 20),
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
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Prayer(),
  ));
}