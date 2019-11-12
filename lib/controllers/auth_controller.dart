import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_quito/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quito/views/pages/_pages.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_quito/views/widgets/AlertDialogSingleButton.dart';

class AuthController {
  Future login(BuildContext context, User user) async {
    Map<String, dynamic> requestBody = {
      "username": user.username,
      "password": user.password
    };
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      final response = await http
          .post("https://quito-api.herokuapp.com/user/login",
              headers: headers, body: jsonEncode(requestBody))
          .timeout(Duration(seconds: 20));
      switch (response.statusCode) {
        case 200:
          {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => new HomePage()));
                return response.body;
          }
          break;
                case 401:
        {
          showAlertDialog(
              context, "Unauthorized", "You are unauthorized to login", "Ok");

        }
        break;
      case 403:
        {
          showAlertDialog(
              context, "Forbidden", "Forbidden access to resource", "Ok");

        }
        break;
      case 415:
        {
          showAlertDialog(context, "Invalid media", "", "Ok");
        }
        break;
      case 500:
        {
          showAlertDialog(context, "Something drastic happened", "", "Ok");
        }
      break;
      default:
        {
          showAlertDialog(context, "Something happened", "", "Ok");
        }
        break;
      }
    } catch (e) {
      showAlertDialog(context, e.toString(), e.toString(), "Ok");
    }
  }
}
