import 'package:flutter/material.dart';
import 'package:iti/model.dart';
import 'package:iti/storydetail.dart';

class Story extends StatelessWidget {
  static const String routeName = 'home';

  List<Map<String, String>> stories = [
    {"name": "الأسد والفأر", "image": "images/lion.jpeg", "background": "images/lion.jpeg"},
    {"name": "الثعلب ف حقل العنب", "image": "images/fox.jpeg", "background": "images/fox.jpeg"},
    {"name": "الحمار الأحمق", "image": "images/donkey.jpeg", "background": "images/donkey.jpeg"},
    {"name": "الراعي الكذاب", "image": "images/shepherd.jpeg", "background": "images/shepherd.jpeg"},
    {"name": "الصياد والسمكة الصغيره", "image": "images/fisherman_and_fish.jpeg", "background": "images/fisherman_and_fish.jpeg"},
    {"name": "الصيصان السبعه", "image": "images/seven_chicks.jpeg", "background": "images/seven_chicks.jpeg"},
    {"name": "الغراب العطشان", "image": "images/thirsty_crow.jpeg", "background": "images/thirsty_crow.jpeg"},
    {"name": "الكلب الطماع", "image": "images/greedy_dog.jpeg", "background": "images/greedy_dog.jpeg"},
    {"name": "الولد الكسول", "image": "images/lazy_boy.jpeg", "background": "images/lazy_boy.jpeg"},
    {"name": "قصة الماعزان", "image": "images/two_goats.jpeg", "background": "images/two_goats.jpeg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 193, 220),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 166, 99, 195),
        title: Text('Stories', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset("images/story.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 15),
            child: Text(
              "تمتع معنا باجمل القصص",
              style: TextStyle(
                color: Color.fromARGB(255, 166, 99, 195),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final story = stories[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoryDetails(
                          story: StoryModel(index, story['name']!),
                           background: story['background']!,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(story['image']!),
                    ),
                    title: Text(
                      story['name']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
              itemCount: stories.length,
            ),
          ),
        ],
      ),
    );
  }
}
