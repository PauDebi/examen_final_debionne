import 'dart:convert';

import 'package:examen_final_debionne/models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier{
  List<User> users = [];
  final String url = "https://ca43c1566db558a7968e.free.beeceptor.com/api/alumnos/";

  Future<void> fetchUsers() async {
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
}