import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/view_models/vm_login.dart';
import 'package:talawa/view_models/vm_register.dart';
import 'package:talawa/views/pages/_pages.dart';
import 'package:http/http.dart' as http;
import 'package:talawa/views/widgets/AlertDialogSingleButton.dart';

class AuthController with ChangeNotifier {
  User currentUser;

  AuthController() {
    print("new AuthController");
  }

  Future<User> getUser() {
    return Future.value(currentUser);
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
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
            currentUser = new User.fromJson(parseJwt(responseBody['token']));
            print("current user: " + currentUser.email);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => new HomePage()));
            return 'User logged in';
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
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(response.body)));
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
