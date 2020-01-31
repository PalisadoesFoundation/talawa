import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/model/token.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/view_models/vm_login.dart';
import 'package:talawa/view_models/vm_register.dart';
import 'package:talawa/views/pages/_pages.dart';
import 'package:http/http.dart' as http;
import 'package:talawa/views/widgets/AlertDialogSingleButton.dart';

class AuthController with ChangeNotifier {
  int currentUserId;

  AuthController() {
    print("new AuthController");
  }

  Future<bool> getUser() async {
    currentUserId = await Preferences.getCurrentUserId();
    if (currentUserId == -1) {
      return false;
    }
    return true;
  }

  Future<String> login(BuildContext context, LoginViewModel user) async {
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
            final responseBody = json.decode(response.body);
            final Token token = new Token(tokenString: responseBody['token']);
            currentUserId = await Preferences.saveCurrentUserId(token);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => new HomePage()));
            return 'User logged in';
          }
          break;
        case 401:
          {
            showAlertDialog(
                context, "Unauthorized", "Invalid username/password", "Ok");
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
            final responseBody = jsonDecode(response.body);
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(responseBody['message']),
                duration: Duration(seconds: 5)));
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

  void logout(BuildContext context) async {
    currentUserId = -1;
    await Preferences.clearUser();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => new LoginPage()));
  }
}
