import 'package:flutter/material.dart';



class Azkar extends StatelessWidget {
  final List<Adhkar> adhkarList = [
    Adhkar('سُبْحَانَ اللَّهِ'),
    Adhkar('الْحَمْدُ لِلَّهِ'),
    Adhkar('اللَّهُ أَكْبَرُ'),
    Adhkar('لاَ إِلَهَ إِلاَّ اللَّهُ'),
    Adhkar('أَسْتَغْفِرُ اللَّهَ'),
     Adhkar('لاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللَّهِ'),
      Adhkar('أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ'),
       Adhkar('الْحَمْدُ للَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا، وَإِلَيْهِ النُّشُورُ'),
        Adhkar("رَضِيتُ بِاللَّهِ رَبًّا، وَبِالْإِسْلاَمِ دِينًا، وَبِمُحَمَّدٍ صَلَّى اللهُ عليهِ وسَلم نَبِيًّا"),
         
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 247, 245, 244),
        title: Text('أذكار'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/edited_azkar.jpeg"), // ضع مسار الصورة الخلفية هنا
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: adhkarList.length,
          itemBuilder: (context, index) {
            return AdhkarTile(adhkar: adhkarList[index]);
          },
        ),
      ),
    );
  }
}

class Adhkar {
  final String text;
  int count;

  Adhkar(this.text, {this.count = 0});
}

class AdhkarTile extends StatefulWidget {
  final Adhkar adhkar;

  AdhkarTile({required this.adhkar});

  @override
  _AdhkarTileState createState() => _AdhkarTileState();
}

class _AdhkarTileState extends State<AdhkarTile> {
  void _incrementCount() {
    setState(() {
      widget.adhkar.count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 244, 232, 229).withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text(widget.adhkar.text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text('عدد المرات: ${widget.adhkar.count}'),
        trailing: IconButton(
          icon: Icon(Icons.add),
          onPressed: _incrementCount,
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('ذكر'),
                content: Text(widget.adhkar.text),
                actions: <Widget>[
                  TextButton(
                    child: Text('إغلاق'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}