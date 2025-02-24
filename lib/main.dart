import 'package:examen_final_debionne/screens/homeScreen.dart';
import 'package:examen_final_debionne/screens/loginScreen.dart';
import 'package:flutter/material.dart';

void main() async{
  runApp(MainApp());
}

class MainApp extends StatelessWidget{
  MainApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
