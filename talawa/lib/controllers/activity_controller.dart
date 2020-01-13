import 'package:talawa/model/activity.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/views/pages/home_page.dart';
import 'package:talawa/views/widgets/_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:talawa/utils/globals.dart';

class ActivityController {
  Future<List<Activity>> getActivities() async {
    final response = await http.get(baseRoute + "/activities");

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var data = json.decode(response.body);
      data = data['activities'];
      return (data as List)
          .map((activity) => new Activity.fromJson(activity))
          .toList();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load projects');
    }
  }
  Future<List<User>> getUsers() async {
    final response = await http.get(baseRoute + "/user");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var data = json.decode(response.body);
      data = data['users'];
      return (data as List)
          .map((user) => new User.fromJson(user))
          .toList();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load projects');
    }
  }
  
  Future postActivity(BuildContext context, Activity activity, List<int> users) async {
    
    Map<String, dynamic> requestBody = {
      "title": activity.title,
      "date": activity.date,
      "description": activity.description,
      "users": users
    };
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try{
      final response = await http
          .post(baseRoute + '/activities',
              headers: headers, body: jsonEncode(requestBody))
          .timeout(Duration(seconds: 20));
      switch (response.statusCode) {
        case 201:
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
