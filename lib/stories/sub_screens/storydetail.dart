import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iti/stories/model/model.dart';

class StoryDetails extends StatefulWidget {
  final StoryModel story;
  final String background;

  const StoryDetails({Key? key, required this.story, required this.background}) : super(key: key);

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
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 166, 99, 195),
        centerTitle: true,
        title: Text(
          widget.story.name,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.background),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                verses[index],
                style: TextStyle(fontSize: 18, color: Colors.purple),
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
