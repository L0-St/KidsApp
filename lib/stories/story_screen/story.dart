import 'package:flutter/material.dart';
import 'package:iti/stories/model/model.dart';
import 'package:iti/stories/sub_screens/storydetail.dart';

class Story extends StatelessWidget {
  static const String routeName = 'home';

  List<Map<String, String>> stories = [
    {
      "name": "الأسد والفأر",
      "image": "assets/images/lion.jpeg",
      "background": "assets/images/S_1.jpeg"
    },
    {
      "name": "الثعلب ف حقل العنب",
      "image": "assets/images/fox.jpeg",
      "background": "assets/images/S_1.jpeg"
    },
    {
      "name": "الحمار الأحمق",
      "image": "assets/images/donkey.jpeg",
      "background": "assets/images/S_1.jpeg"
    },
    {
      "name": "الراعي الكذاب",
      "image": "assets/images/shepherd.jpeg",
      "background": "assets/images/S_1.jpeg"
    },
    {
      "name": "الصياد والسمكة الصغيره",
      "image": "assets/images/fisherman_and_fish.jpeg",
      "background": "assets/images/S_1.jpeg"
    },
    {
      "name": "الصيصان السبعه",
      "image": "assets/images/seven_chicks.jpeg",
      "background": "assets/images/S_1.jpeg"
    },
    {
      "name": "الغراب العطشان",
      "image": "assets/images/thirsty_crow.jpeg",
      "background": "assets/images/S_1.jpeg"
    },
    {
      "name": "الكلب الطماع",
      "image": "assets/images/greedy_dog.jpeg",
      "background": "assets/images/S_1.jpeg"
    },
    {
      "name": "الولد الكسول",
      "image": "assets/images/lazy_boy.jpeg",
      "background": "assets/images/S_1.jpeg"
    },
    {
      "name": "قصة الماعزان",
      "image": "assets/images/two_goats.jpeg",
      "background": "assets/images/S_1.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            child: Image.asset("assets/images/children.jpg"),
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
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                          height: MediaQuery.sizeOf(context).height*0.1,
                          width: MediaQuery.sizeOf(context).width*0.2,
                          child: Image.asset(story['image']!)
                      ),
                    ),
                    title: Text(
                      story['name']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.purple,
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
