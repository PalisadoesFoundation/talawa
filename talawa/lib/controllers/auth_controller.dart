import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/view_models/vm_login.dart';
import 'package:talawa/view_models/vm_register.dart';
import 'package:talawa/views/pages/_pages.dart';
import 'package:http/http.dart' as http;
import 'package:talawa/views/widgets/AlertDialogSingleButton.dart';
import 'package:talawa/views/widgets/snackbar.dart';

class AuthController {
  Future login(BuildContext context, LoginViewModel user) async {
    Map<String, dynamic> requestBody = {
      "email": user.email,
      "password": user.password
    };
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      final response = await http
          .post(baseRoute + "/user/login",
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

  Future register(BuildContext context, RegisterViewModel user) async {
    Map<String, dynamic> requestBody = {
      "firstName": user.firstName,
      "lastName": user.lastName,
      "email": user.email,
      "password": user.password
    };
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      final response = await http
          .post(baseRoute + "/user/register",
              headers: headers, body: jsonEncode(requestBody))
          .timeout(Duration(seconds: 20));
      switch (response.statusCode) {
        case 201:
          {
            return response;
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
