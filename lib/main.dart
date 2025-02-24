import 'package:examen_final_debionne/models/User.dart';
import 'package:examen_final_debionne/provider/userProvider.dart';
import 'package:examen_final_debionne/screens/homeScreen.dart';
import 'package:examen_final_debionne/screens/loginScreen.dart';
import 'package:examen_final_debionne/screens/userDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  
  runApp(MainApp());
}

class MainApp extends StatelessWidget{
  MainApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (context) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {
          '/home': (context) => HomeScreen(),
          '/login': (context) => LoginScreen(),
          '/userDetail': (context) => UserDetailScreen(user: ModalRoute.of(context)!.settings.arguments as User),
        },
      ),
    );
  }
}
