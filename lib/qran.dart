import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Quran extends StatefulWidget {
  const Quran({Key? key}) : super(key: key);

  @override
  State<Quran> createState() => _QuranState();
}

class Surah {
  final String name;
  final String url;
  final String image;
  final List<String> ayat;

  Surah({
    required this.name,
    required this.url,
    required this.image,
    required this.ayat,
  });
}

class _QuranState extends State<Quran> {
  final List<Surah> surahs = [
    Surah(
      name: "سورة الفاتحة",
      url: "https://youtu.be/rJIsyMuk5rU",
      image: "images/th (25).jpeg",
      ayat: [
        "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ (1)",
        "ٱلۡحَمۡدُ لِلَّهِ رَبِّ ٱلۡعَٰلَمِينَ (2) ",
        "ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ (3) ",
        "مَٰلِكِ يَوۡمِ ٱلدِّينِ (4)",
        "إِيَّاكَ نَعۡبُدُ وَإِيَّاكَ نَسۡتَعِينُ (5)",
         "ٱهۡدِنَا ٱلصِّرَٰطَ ٱلۡمُسۡتَقِيمَ (6)",
        " صِرَٰطَ ٱلَّذِينَ أَنۡعَمۡتَ علَيۡهِمۡ غَيۡرِ ٱلۡمَغۡضُوبِ عَلَيۡهِمۡ وَلَا ٱلضَّآلِّينَ (7)"

        // Add all Ayat here
      ],
    ),
    Surah(
      name: "سورة الإخلاص",
      url: "https://youtu.be/OH74taV8wRE",
      image: "images/th (17).jpeg",
      ayat: [
        "قُلۡ هُوَ ٱللَّهُ أَحَدٌ (1)",
        "ٱللَّهُ ٱلصَّمَدُ (2)",
        " لَمۡ يَلِدۡ وَلَمۡ يُولَدۡ (3) ",
        "وَلَمۡ يَكُن لَّهُۥ كُفُوًا أَحَدُۢ (4)",
        
        // Add all Ayat here
      ],
    ),
    Surah(
      name: "سورة الفلق",
      url: "https://youtu.be/kVoDlXwPMqc",
      image: "images/th (18).jpeg",
      ayat: [
        "قُلۡ أَعُوذُ بِرَبِّ ٱلۡفَلَقِ (1)",
        "مِن شَرِّ مَا خَلَقَ (2) ",
        "  وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ (3)",
        " وَمِن شَرِّ ٱلنَّفَّٰثَٰتِ فِي ٱلۡعُقَدِ (4) ",
        " وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ (5)",
        
        // Add all Ayat here
      ],
    ),
     Surah(
      name: "سورة الناس",
      url: "https://youtu.be/TyKwwVemYhw",
      image: "images/th (19).jpeg",
      ayat: [
        "قُلۡ أَعُوذُ بِرَبِّ ٱلنَّاسِ (1) ",
        " (2) مَلِكِ ٱلنَّاسِ  ",
        "إِلَٰهِ ٱلنَّاسِ (3)  ",
        " مِن شَرِّ ٱلۡوَسۡوَاسِ ٱلۡخَنَّاسِ (4)",
        " (5)ٱلَّذِي يُوَسۡوِسُ فِي صُدُورِ ٱلنَّاسِ ",
        "مِنَ ٱلۡجِنَّةِ وَٱلنَّاسِ (6)"
        
        // Add all Ayat here
      ],
    ),
      Surah(
      name: "سورة الكافرون ",
      url: "https://youtu.be/3q9yntp_dhY",
      image: "images/th (20).jpeg",
      ayat: [
        "قُلۡ يَٰٓأَيُّهَا ٱلۡكَٰفِرُونَ (1)",
        " لَآ أَعۡبُدُ مَا تَعۡبُدُونَ (2) ",
        "وَلَآ أَنتُمۡ عَٰبِدُونَ مَآ أَعۡبُدُ (3) ",
        "وَلَآ أَنَا۠ عَابِدٞ مَّا عَبَدتُّمۡ (4) ",
        " وَلَآ أَنتُمۡ عَٰبِدُونَ مَآ أَعۡبُدُ (5)",
        " لَكُمۡ دِينُكُمۡ وَلِيَ دِينِ (6)"

        
        // Add all Ayat here
      ],
    ),
     Surah(
      name: "سورة النصر",
      url: "https://youtu.be/vDGwQD6cZd8",
      image: "images/th (21).jpeg",
      ayat: [
        "إِذَا جَآءَ نَصۡرُ ٱللَّهِ وَٱلۡفَتۡحُ (1)",
        " وَرَأَيۡتَ ٱلنَّاسَ يَدۡخُلُونَ فِي دِينِ ٱللَّهِ أَفۡوَاجٗا (2)",
        "فَسَبِّحۡ بِحَمۡدِ رَبِّكَ وَٱسۡتَغۡفِرۡهُۚ إِنَّهُۥ كَانَ تَوَّابَۢا (3) ",
               // Add all Ayat here
      ],
    ),
     Surah(
      name: "سورة المسد",
      url: "https://youtu.be/0S0WEBUbr00",
      image: "images/th (22).jpeg",
      ayat: [
        "تَبَّتۡ يَدَآ أَبِي لَهَبٖ وَتَبَّ (1)",
        " مَآ أَغۡنَىٰ عَنۡهُ مَالُهُۥ وَمَا كَسَبَ (2)",
        "سَيَصۡلَىٰ نَارٗا ذَاتَ لَهَبٖ (3)",
             "وَٱمۡرَأَتُهُۥ حَمَّالَةَ ٱلۡحَطَبِ (4) ",
            "فِي جِيدِهَا حَبۡلٞ مِّن مَّسَدِۭ (5)" ,  // Add all Ayat here
      ],
    ),
     Surah(
      name: "سورة قريش",
      url: "https://youtu.be/HCVot40t-dk",
      image: "images/download (1).jpeg",
      ayat: [
        "لِإِيلَٰفِ قُرَيۡشٍ (1)",
        "إِۦلَٰفِهِمۡ رِحۡلَةَ ٱلشِّتَآءِ وَٱلصَّيۡفِ (2)",
        " فَلۡيَعۡبُدُواْ رَبَّ هَٰذَا ٱلۡبَيۡتِ (3)",
             "ٱلَّذِيٓ أَطۡعَمَهُم مِّن جُوعٖ وَءَامَنَهُم مِّنۡ خَوۡفِۭ (4) ",
             // Add all Ayat here
      ],
    ),
    Surah(
      name: "سورة الماعون",
      url: "https://youtu.be/XwzC0Fm5ubk",
      image: "images/th (23).jpeg",
      ayat: [
        "أَرَءَيۡتَ ٱلَّذِي يُكَذِّبُ بِٱلدِّينِ (1)",
        " فَذَٰلِكَ ٱلَّذِي يَدُعُّ ٱلۡيَتِيمَ (2)",
        " وَلَا يَحُضُّ عَلَىٰ طَعَامِ ٱلۡمِسۡكِينِ (3)",
             " فَوَيۡلٞ لِّلۡمُصَلِّينَ (4)",
             "ٱلَّذِينَ هُمۡ عَن صَلَاتِهِمۡ سَاهُونَ (5)",
            "ٱلَّذِينَ هُمۡ يُرَآءُونَ (6)" ,
            "وَيَمۡنَعُونَ ٱلۡمَاعُونَ (7)"
             // Add all Ayat here
      ],
    ),
    Surah(
      name: "سورة الكوثر ",
      url: "https://youtu.be/Kz7_R4YtQBw",
      image: "images/th (24).jpeg",
      ayat: [
        "إِنَّآ أَعۡطَيۡنَٰكَ ٱلۡكَوۡثَرَ (1)",
        " فَصَلِّ لِرَبِّكَ وَٱنۡحَرۡ (2)",
        "إِنَّ شَانِئَكَ هُوَ ٱلۡأَبۡتَرُ (3) ",
            
             // Add all Ayat here
      ],
    ),/// Add more Surahs here
  ];

  late List<YoutubePlayerController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = surahs.map<YoutubePlayerController>((surah) {
      String? id = YoutubePlayer.convertUrlToId(surah.url);
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
        backgroundColor: Color.fromARGB(221, 198, 166, 87),
        title: Center(
          child: Text(
            "القرءان الكريم",
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
            padding: const EdgeInsets.only(top: 15.0, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('images/Group 23.png'),
                SizedBox(height: 10),
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "اختار السورة",
              style: TextStyle(
                color:  Color.fromARGB(221, 198, 166, 87),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: surahs.length,
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
                            surahs[index].image,
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
                                surahs[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
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
                          surah: surahs[index],
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
  final Surah surah;
  final YoutubePlayerController? nextController;
  final YoutubePlayerController? previousController;

  const VideoPage({
    Key? key,
    required this.controller,
    required this.surah,
    this.nextController,
    this.previousController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surah.name),
        backgroundColor: Color.fromARGB(221, 198, 166, 87),
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
              surah.name,
              style: TextStyle(fontSize: 16, color: const Color.fromARGB(221, 255, 254, 254)),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListView.builder(
                itemCount: surah.ayat.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      surah.ayat[index],
                      style: TextStyle(fontSize: 16, color: const Color.fromARGB(221, 247, 245, 245)),
                    ),
                  );
                },
              ),
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
                              surah: surah,
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
                              surah: surah,
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


