import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:talawa/views/widgets/AlertDialogSingleButton.dart';

import 'globals.dart';

class Api with ChangeNotifier {
  Future postRequest(BuildContext context, Map<String, dynamic> requestBody,
      Map<String, dynamic> headers, String route) async {
    try {
      final response = await http
          .post(baseRoute + route,
              headers: headers, body: jsonEncode(requestBody))
          .timeout(Duration(seconds: 20));

      switch (response.statusCode) {
        case 201 | 200:
          {
            return response.body;
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

  Future getRequest() {}
  Future patchRequest() {}
  Future deleteRequest() {}
}
