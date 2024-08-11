import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LearningWidget extends StatefulWidget {
  LearningWidget({
    required this.imagesList,
    required this.wordsList,
    required this.title,
    required this.underTitle,
    required this.isNumberPage,
  });

  final List<String> imagesList;
  final List<String> wordsList;
  final String title;
  final String underTitle;
  final bool isNumberPage;

  @override
  State<LearningWidget> createState() => _LearningWidgetState();
}

class _LearningWidgetState extends State<LearningWidget> {
  bool isPressed = false;
  int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 193, 220),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 40,
                      ),
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(fontSize: 40),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Match the correct ${widget.underTitle}\nby placing it on the screen",
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.65),
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: isPressed
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 150,
                            width: 200,
                            child: Image.asset(
                              widget.imagesList[index!],
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 25),
                          Text(
                            widget.isNumberPage
                                ? "( $index = ${widget.wordsList[index!]} )"
                                : "( ${widget.wordsList[index!]} )",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    : const Text(
                        'Tap an image below',
                        style: TextStyle(fontSize: 24, color: Colors.grey),
                      ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 150,
              width: double.infinity,
              color: Colors.white,
              child: ListView.separated(
                itemCount: widget.imagesList.length ~/ 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isPressed = true;
                          index = i;
                        });
                      },
                      child: Image.asset(
                        widget.imagesList[i],
                        height: 40,
                        width: 40,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isPressed = true;
                          index = widget.isNumberPage ? i + 5 : i + 4;
                        });
                      },
                      child: Image.asset(
                        widget.imagesList[widget.isNumberPage ? i + 5 : i + 4],
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => SizedBox(
                  width: widget.isNumberPage ? 45 : 65,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



