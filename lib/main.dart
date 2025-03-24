import 'package:flutter/material.dart';
import 'package:haha_entertainer/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haha Entertainer',
      theme: ThemeData(
        primarySwatch:Colors.green
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
