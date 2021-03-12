import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/model/token.dart';
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

  //Checks if user is logged in via local storage
  Future<bool> getUser() async {
    currentUserId = await Preferences.getCurrentUserId();
    if (currentUserId == -1) {
      return false;
    }
    return true;
  }

  //Log in user
  Future<String> login(BuildContext context, LoginViewModel user) async {
    //Create request body
    Map<String, dynamic> requestBody = {
      "email": user.email,
      "password": user.password
    };

    //Create json header for request
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      //Store response from API request
      final response = await http
          .post(baseRoute + "/auth/login",
              headers: headers, body: jsonEncode(requestBody))
          .timeout(Duration(seconds: 20));
      switch (response.statusCode) {
        //Navigate user to activity screen upon successful login
        case 200:
          {
            //Decode json response
            final responseBody = json.decode(response.body);

            //Store user token in local storage
            final Token token = new Token(tokenString: responseBody['token']);
            // currentUserId = await Preferences.saveCurrentUserId(token);

            //Navigate user to activity screen
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => new HomePage()));
            return 'User logged in';
          }
          break;

        //Exceptions
        case 401:
          {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("You are unauthorized to login"),
                duration: Duration(seconds: 5)));
          }
          break;
        case 403:
          {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Forbidden access to resource"),
                duration: Duration(seconds: 5)));
          }
          break;
        case 415:
          {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Invalid media"),
                duration: Duration(seconds: 5)));
          }
          break;
        case 500:
          {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Something drastic happened"),
                duration: Duration(seconds: 5)));
          }
          break;
        default:
          {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Something happened"),
                duration: Duration(seconds: 5)));
          }
          break;
      }
    } catch (e) {
      showAlertDialog(context, e.toString(), e.toString(), "Ok");
    }
  }

  //Registers user
  Future register(BuildContext context, RegisterViewModel user) async {
    //
    Map<String, dynamic> requestBody = {
      "firstName": user.firstName,
      "lastName": user.lastName,
      "email": user.email,
      "password": user.password
    };
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      final response = await http
          .post(baseRoute + "/auth/register",
              headers: headers, body: jsonEncode(requestBody))
          .timeout(Duration(seconds: 20));
      switch (response.statusCode) {
        case 201 | 200:
          {
            final responseBody = jsonDecode(response.body);
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(responseBody['message']),
                duration: Duration(seconds: 5)));
          }
          break;
        case 401:
          {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("You are unauthorized to login"),
                duration: Duration(seconds: 5)));
          }
          break;
        case 403:
          {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Forbidden access to resource"),
                duration: Duration(seconds: 5)));
          }
          break;
        case 415:
          {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Invalid media"),
                duration: Duration(seconds: 5)));
          }
          break;
        case 500:
          {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Something drastic happened"),
                duration: Duration(seconds: 5)));
          }
          break;
        default:
          {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Something happened"),
                duration: Duration(seconds: 5)));
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
