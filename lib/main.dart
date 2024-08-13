import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iti/login/cubit/login_cubit.dart';
import 'package:iti/splash.dart';

import 'package:provider/provider.dart';
import 'package:iti/onboarding/first.dart';
import 'package:iti/home/home1.dart';
import 'package:iti/religion/main_screen/islamic.dart';
import 'package:iti/letters&numbers/main_screen/learn1.dart';
import 'package:iti/religion/sub_screens/quran_screen/qran.dart';
import 'package:iti/theme/theme_provider.dart';

import 'helpers/hive_helper.dart';
import 'splash/splash_screen.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.TOKEN);
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        // theme: themeProvider.getTheme(),  // Use the theme from the ThemeProvider
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
