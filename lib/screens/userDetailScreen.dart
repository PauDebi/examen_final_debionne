import 'package:examen_final_debionne/models/User.dart';
import 'package:examen_final_debionne/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailScreen extends StatelessWidget {
  User user;
  UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.nom),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              final provider = Provider.of<UserProvider>(context, listen: false);
              provider.deleteUser(user.id);
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/home',
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Id: ${user.id}"),
            Text("Nombre: ${user.nom}"),
            Text("Decripcio: ${user.descripcio}"),
            Text("Curs: ${user.asignaturaPreferida}"),
            Text("Cicle: ${user.notaPromedio}"),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.foto),
            ),
          ],
        ),
      ),
    );
  }
}