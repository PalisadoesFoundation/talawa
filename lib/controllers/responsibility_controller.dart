import 'package:talawa/model/responsibility.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/view_models/vm_add_responsibility.dart';
import 'package:talawa/views/pages/_pages.dart';
import 'package:talawa/views/widgets/_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:talawa/utils/globals.dart';

class ResponsibilityController with ChangeNotifier {
  Future<List<Responsibility>> getResponsibilitiesByActivity(
      BuildContext context, int activityId) async {
    final response = await http.get(
        baseRoute + "/responsibility/getByActivity/" + activityId.toString());

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var data = json.decode(response.body);
      data = data['responsibilities'];
      return (data as List)
          .map((resp) => new Responsibility.fromJson(resp))
          .toList();
    } else {
      // If that call was not successful, throw an error.
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Failed to load responsibilities"),
          duration: Duration(seconds: 5)));
    }
    return new List<Responsibility>();
  }

  Future<Responsibility> getResponsibility(
      BuildContext context, int respId) async {
    final response =
        await http.get(baseRoute + "/responsibility/" + respId.toString());

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var data = json.decode(response.body);
      return new Responsibility.fromJson(data);
    } else {
      // If that call was not successful, throw an error.
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Failed to load responsibility"),
          duration: Duration(seconds: 5)));
    }
    return Responsibility();
  }

  Future postResponsibility(
      BuildContext context, AddResponsibilityViewModel resp) async {
    Map<String, dynamic> requestBody = {
      "title": resp.title,
      "datetime": resp.datetime,
      "description": resp.description,
      "activityId": resp.activityId,
      "userId": resp.userId
    };
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      final response = await http
          .post(baseRoute + '/responsibility',
              headers: headers, body: jsonEncode(requestBody))
          .timeout(Duration(seconds: 20));
      switch (response.statusCode) {
        case 201:
          {
            Navigator.of(context).pop();
            notifyListeners();
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

  Future<List<User>> getUsersByActivity(
      BuildContext context, int activityId) async {
    final response = await http
        .get(baseRoute + "/user/getUsersByActivity/" + activityId.toString());

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var data = json.decode(response.body);
      data = data['users'];
      return (data as List).map((user) => new User.fromJson(user)).toList();
    } else {
      // If that call was not successful, throw an error.
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Failed to load users"),
          duration: Duration(seconds: 5)));
    }
    return new List<User>();
  }

  Future updateResponsibility(BuildContext context, Responsibility oldModel,
      Responsibility newModel) async {
    var oldModelMap = toMap(oldModel);
    var newModelMap = toMap(newModel);

    oldModelMap.forEach((oldKey, oldAttr) {
      newModelMap.removeWhere((newKey, newAttr) => newAttr == oldAttr);
    });
    Map<String, dynamic> requestBody = {"updates": newModelMap};
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.patch(
          baseRoute + "/responsibility/" + oldModel.id.toString(),
          headers: headers,
          body: jsonEncode(requestBody));
      if (response.statusCode == 200) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => new HomePage()));
        notifyListeners();
      }
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Failed updating responsibility"),
          duration: Duration(seconds: 5)));
    }
  }

  Map<String, dynamic> toMap(Responsibility model) {
    return {
      "title": model.title,
      "datetime": model.datetime,
      "description": model.description
    };
  }
}
