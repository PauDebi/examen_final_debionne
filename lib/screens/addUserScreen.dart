import 'package:examen_final_debionne/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController idController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController asignaturaPreferidaController = TextEditingController();
    final TextEditingController notaPromedioController = TextEditingController();
    final TextEditingController fotoController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Añadir Alumno"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(hintText: 'Id'),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Nombre'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: 'Descripción'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: asignaturaPreferidaController,
              decoration: const InputDecoration(hintText: 'Asignatura Preferida'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: notaPromedioController,
              decoration: const InputDecoration(hintText: 'Nota Promedio'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: fotoController,
              decoration: const InputDecoration(hintText: 'Foto'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (idController.text.isEmpty ||
                    nameController.text.isEmpty ||
                    descriptionController.text.isEmpty ||
                    asignaturaPreferidaController.text.isEmpty ||
                    notaPromedioController.text.isEmpty ||
                    fotoController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Por favor, rellene todos los campos')),
                  );
                  return;
                }
                final provider = Provider.of<UserProvider>(context, listen: false);
                provider.addUser(
                  idController.text,
                  nameController.text,
                  descriptionController.text,
                  asignaturaPreferidaController.text,
                  notaPromedioController.text,
                  fotoController.text,
                );
                Navigator.of(context).pop();
              },
              child: const Text('Añadir Alumno'),
            ),
          ],
        ),
      ),
    );
  }
}