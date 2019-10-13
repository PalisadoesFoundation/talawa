import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_quito/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quito/ui/page/home_page.dart';
import 'package:http/http.dart' as http;

class AuthController {
  Future login(BuildContext context, User user) async {
    Map<String, dynamic> requestBody = {
      "UserName": user.username,
      "Password": user.password
    };
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      final response = await http
          .post("http://localhost:3001/users/login",
              headers: headers, body: jsonEncode(requestBody))
          .timeout(Duration(seconds: 20));
      switch (response.statusCode) {
        case 200:
          {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => new HomePage()));
                return;
          }
          break;
                case 401:
        {
          print("Unauthorized");
        }
        break;
      case 403:
        {
          print("Forbidden");
        }
        break;
      case 415:
        {
          print("Invalid Media");
        }
        break;
      case 500:
        {
          print("Something drastic happened");
        }
        break;
      default:
        {
          print("Something happened");
        }
        break;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
