import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Moral extends StatefulWidget {
  const Moral({Key? key}) : super(key: key);

  @override
  State<Moral> createState() => _HomePageState();
}

class _HomePageState extends State<Moral> {
  final List<String> urls = [
    "https://youtu.be/vD98OvvDNEs", // TODO : not suitable video
    "https://youtu.be/KiRaco7D58Y",
    "https://youtu.be/gZzA5PSMUmU",
    "https://youtu.be/1R9H7DZOw2I",
    "https://youtu.be/TMw8wGSEhHg",
    "https://youtu.be/-QKbqRCh_BA",
    "https://youtu.be/7YAksoyMGpw",
    "https://youtu.be/fAGYKj3AyTA",
    "https://youtu.be/ydKCpSD1CC0", // TODO : check video
    "https://youtu.be/8UvzEBnF9uk"
  ];

  final List<String> videoDescriptions = [
    "عليم الأطفال الآداب | قصة عن الأمانة ",
    "قصة جمال الصدق - قصة عن الصدق",
    "قصة عن التعاون بين الإخوة للأطفال ",
    "| آداب النظافة الشخصية",
    "قصة للأطفال عن التسامح",
    "التنمر المدرسي | قصص اطفال ",
    "قصة رمضان للاطفال الصغار | رمضان كريم",
    "الحفاظ على النظافه في البيت والمدرسه والاماكن العامه لنحافظ على بيئتنا نظيفه",
    "الاحترام كارتون تعليمي للاطفال",
      "كرتون العطف على الفقراء | قصص كرتونية للأطفال | الاسكوله للأطفال | الاسكوله كيدز"

  ];

  final List<String> img = [
    "assets/images/th (6).jpeg",
    "assets/images/th (7).jpeg",
    "assets/images/th (8).jpeg",
    "assets/images/th (9).jpeg",
    "assets/images/th (10).jpeg",
    "assets/images/th (11).jpeg",
    "assets/images/th (12).jpeg",
    "assets/images/th (13).jpeg",
    "assets/images/th (14).jpeg",
    "assets/images/th (15).jpeg",
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
        backgroundColor: Color.fromARGB(221, 244, 239, 198),
        title: Text(
          "Moral",
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
                Image.asset('assets/images/Group 21.png'),
                SizedBox(height:  MediaQuery.sizeOf(context).height*0.012),
              
              ],
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height*0.016),
          Center(
            child: Text(
              "تعلم معنا بعض الاخلاق السامية ",
              style: TextStyle(
                color: Color.fromARGB(221, 239, 184, 89),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Center(
            child: Text(
              "التى يحثنا عليها ديننا الاسلامى",
              style: TextStyle(
                color: Color.fromARGB(221, 239, 184, 89),
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
                            width:MediaQuery.sizeOf(context).width*0.36,
                            height: MediaQuery.sizeOf(context).width*0.2,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: MediaQuery.sizeOf(context).width*0.04),
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
        backgroundColor: Color.fromARGB(221, 244, 239, 198),
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
          SizedBox(height: MediaQuery.sizeOf(context).height*0.023),
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