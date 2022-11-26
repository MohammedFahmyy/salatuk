import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salatuk/shared/bloc_observer.dart';
import 'package:salatuk/shared/constants/constants.dart';

import 'layout/main_layout.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]); 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
        elevation: 0,
          titleTextStyle: TextStyle(
            color: AppColors.secondary,
            fontSize: 32,
            fontFamily: "Arabic",
          ),
        ),
      ),
      home: SalatukHomeScreenLayout(),
    );
  }
}
