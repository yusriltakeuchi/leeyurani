import 'package:flutter/material.dart';
import 'package:leeyurani/ui/constants/constant.dart';
import 'package:leeyurani/ui/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lee Yurani',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: blackColor
      ),
      home: const HomeScreen(),
    );
  }
}