/*import 'package:flutter/material.dart';
import 'package:iti/theme.dart';
import 'package:iti/theme_provider.dart';
import 'package:provider/provider.dart';


class Themebutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 176, 112, 187),
        title: Text('setting',style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 300.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("select theme",style: TextStyle(color: Color.fromARGB(255, 176, 112, 187)),),
              SizedBox(height: 50,),
              ElevatedButton(
                onPressed: () {
                  themeProvider.setTheme(Themes.light);
                },
                 child: Text('Light Theme'),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  themeProvider.setTheme(Themes.dark);
                },
                child: Text('Dark Theme'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/


