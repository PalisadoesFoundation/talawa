import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/utils/globals.dart';
import 'package:http/http.dart' as http;
import 'package:talawa/views/pages/home_page.dart';

class UserController with ChangeNotifier {
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

  Future<User> getUser(int userId) async {
    final response = await http.get(baseRoute + "/user/" + userId.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var userData = json.decode(response.body);
      return new User.fromJson(userData);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load projects');
    }
  }

  Future<bool> validateUserEmail(String email) async {
    Map<String, dynamic> requestBody = {"email": email};
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      final response = await http
          .post(baseRoute + "/user/validateEmail",
              headers: headers, body: jsonEncode(requestBody))
          .timeout(Duration(seconds: 20));
      if(response.statusCode == 200){
        var body = jsonDecode(response.body);
        int count = body['count'];
        print(count);
        if(count > 0){
          return true;
        }
        else{
          return false;
        }

      }
    } catch (e) {
      print(e);
    }
  }

  Future updateUser(BuildContext context, User oldModel, User newModel) async {
    
    var oldModelMap = toMap(oldModel);
    var newModelMap = toMap(newModel);

    oldModelMap.forEach((oldKey, oldAttr){
      newModelMap.removeWhere((newKey, newAttr) => newAttr == oldAttr);
    });
    Map<String, dynamic> requestBody = {
      "updates": newModelMap
    };
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try{
      final response = await http.patch(baseRoute + "/user/" + oldModel.id.toString(), headers: headers, body: jsonEncode(requestBody));
      if(response.statusCode == 200){
        Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => new HomePage()));
            notifyListeners();
      }
    }catch(e){

    }
  }

  Map<String, dynamic> toMap(User model){
    return {
      "firstName": model.firstName,
      "lastName": model.lastName,
      "email": model.email
    };
  }
}
