import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iti/draw.dart';
import 'package:iti/first.dart';
import 'package:iti/home1.dart';
import 'package:iti/islamic.dart';
import 'package:iti/learn1.dart';
import 'package:iti/qran.dart';
import 'package:iti/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeProvider.getTheme(),  // Use the theme from the ThemeProvider
      debugShowCheckedModeBanner: false,
      home: First(),
    );
  }
}
