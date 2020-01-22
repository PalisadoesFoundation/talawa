import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/utils/globals.dart';
import 'package:http/http.dart' as http;

class UserController with ChangeNotifier{
  Future<List<User>> getUsers() async {
    final response = await http.get(baseRoute + "/user");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var data = json.decode(response.body);
      data = data['users'];
      return (data as List).map((user) => new User.fromJson(user)).toList();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load projects');
    }
  }
  
  Future<User> getUser(int userId) async{
    final response = await http.get(baseRoute + "/user/" + userId.toString() );
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var userData = json.decode(response.body);
      return new User.fromJson(userData);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load projects');
    }
    
  }
}