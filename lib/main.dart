import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iti/login/cubit/login_cubit.dart';



import 'helpers/hive_helper.dart';
import 'register/cubit/register_cubit.dart';
import 'splash/splash_screen.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.TOKEN);
  runApp(
      const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);

    return   MultiBlocProvider(providers: [
      BlocProvider(create: (context) => LoginCubit()),
      BlocProvider(create: (context) => RegisterCubit()),
    ],
      child: const GetMaterialApp(
        title: 'Flutter Demo',
        // theme: themeProvider.getTheme(),  // Use the theme from the ThemeProvider
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
// LO_ST.user@gmail.com