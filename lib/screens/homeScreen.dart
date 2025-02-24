import 'package:examen_final_debionne/models/User.dart';
import 'package:examen_final_debionne/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    provider.fetchUsers();
    List<User> users = provider.users;
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index){
          return Container(
            child: Text(users[index].nom),
          );
        }
        
      ),
    );
  }
}