import 'dart:convert';

import 'package:examen_final_debionne/models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier{
  static bool hasFetched = false;
  List<User> users = [];
  final String url = "https://ca43c1566db558a7968e.free.beeceptor.com/api/alumnos/";

  Future<void> fetchUsers() async {
    if (hasFetched) return;
    hasFetched = true;
    print("fetchingUsers");
    final response = await http.get(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
    ); 
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200){
      final responseData = jsonDecode(response.body); 
      List<User> users = responseData.map<User>((user) => User.fromMap(user)).toList();
      this.users = users;
      notifyListeners();
    }
  }

  void addUser(String id, String name, String descripcion, String asignatura_preferida, String nota_promedio, String imageUrl) async{
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "id": id,
        "nom": name,
        "descripcio": descripcion,
        "asignatura_preferida": asignatura_preferida,
        "nota_promedio": nota_promedio,
        "foto": imageUrl,
      }),
    ); 
    if (response.statusCode == 201){
      fetchUsers();
    }
  }

  void deleteUser(int id) async{
    final response = await http.delete(
      Uri.parse(url + id.toString()),
      headers: {"Content-Type": "application/json"},
    ); 
    if (response.statusCode == 200){
      fetchUsers();
    }
  }  
}