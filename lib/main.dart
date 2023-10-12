import 'package:flutter/material.dart';
import 'package:indai/screens/welcome_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0x00000000)
      ),
      home: const WelcomeScreen(),
    );
  }
}