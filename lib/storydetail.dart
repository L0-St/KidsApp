import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iti/model.dart';

class StoryDetails extends StatefulWidget {
  final StoryModel story;

  const StoryDetails({Key? key, required this.story}) : super(key: key);

  @override
  State<StoryDetails> createState() => _StoryDetailsState();
}

class _StoryDetailsState extends State<StoryDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    if (verses.isEmpty) {
      loadSuraFile(widget.story.index);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/back_ground.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            widget.story.name,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                verses[index],
                style: TextStyle(fontSize: 18),
              ),
            );
          },
          itemCount: verses.length,
        ),
      ),
    );
  }

  void loadSuraFile(int index) async {
    String story = await rootBundle.loadString("files/${index + 1}.txt");
    List<String> storyLines = story.split("\n");
    setState(() {
      verses = storyLines;
    });
    print(storyLines);
  }
}
