import 'package:talawa/model/activity.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/view_models/vm_add_activity.dart';
import 'package:talawa/views/pages/home_page.dart';
import 'package:talawa/views/widgets/_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:talawa/utils/globals.dart';

class ActivityController with ChangeNotifier {
  Future<List<Activity>> getActivities(BuildContext context) async {
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
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("unable to fetch activities"),
          duration: Duration(seconds: 5)));
    }
  }

  Future<Activity> getActivity(BuildContext context, int activityId) async {
    final response =
        await http.get(baseRoute + "/activities/" + activityId.toString());
    print(response.statusCode);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      Activity activity = Activity.fromJson(json.decode(response.body));
      return activity;
    } else {
      // If that call was not successful, throw an error.
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("unable to fetch activity"),
          duration: Duration(seconds: 5)));
    }
  }

  Future<List<Activity>> getActivitiesByUser(
      BuildContext context, int userId) async {
    final response = await http.get(
        baseRoute + "/activities/fetchActivitiesByUser/" + userId.toString());
    print(response.statusCode);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var data = json.decode(response.body);
      data = data['activities'];
      return (data as List)
          .map((activity) => new Activity.fromJson(activity))
          .toList();
    } else {
      // If that call was not successful, throw an error.
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("unable to fetch activities"),
          duration: Duration(seconds: 5)));
    }
  }

  Future<List<User>> getUsersByActivity(
      BuildContext context, int activityId, int userId) async {
    final response = await http.get(baseRoute + "/user");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var data = json.decode(response.body);
      data = data['users'];
      return (data as List).map((user) => new User.fromJson(user)).toList();
    } else {
      // If that call was not successful, throw an error.
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("unable to fetch users"),
          duration: Duration(seconds: 5)));
    }
  }

  Future<List<User>> getAvailableUsers(
      BuildContext context, int creator) async {
    final response =
        await http.get(baseRoute + "/user/filter/" + creator.toString());
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      data = data['users'];
      return (data as List).map((user) => new User.fromJson(user)).toList();
    } else {
      // If that call was not successful, throw an error.
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(data['message']), duration: Duration(seconds: 5)));
    }
  }

  Future postActivity(BuildContext context, AddActivityViewModel model) async {
    Map<String, dynamic> requestBody = {
      "title": model.title,
      "datetime": model.datetime,
      "description": model.description,
      "admin": model.admin,
      "users": model.users
    };
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      final response = await http
          .post(baseRoute + '/activities',
              headers: headers, body: jsonEncode(requestBody))
          .timeout(Duration(seconds: 20));
      switch (response.statusCode) {
        case 201:
          {
            Navigator.of(context).pop();
            notifyListeners();
            return;
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

  Future updateActivity(
      BuildContext context, Activity oldModel, Activity newModel) async {
    var oldModelMap = toMap(oldModel);
    var newModelMap = toMap(newModel);

    oldModelMap.forEach((oldKey, oldAttr) {
      newModelMap.removeWhere((newKey, newAttr) => newAttr == oldAttr);
    });
    Map<String, dynamic> requestBody = {"updates": newModelMap};
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.patch(
          baseRoute + "/activities/" + oldModel.id.toString(),
          headers: headers,
          body: jsonEncode(requestBody));
      if (response.statusCode == 200) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => new HomePage()));
        notifyListeners();
      }
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Something happened"), duration: Duration(seconds: 5)));
    }
  }

  Map<String, dynamic> toMap(Activity model) {
    return {
      "title": model.title,
      "datetime": model.datetime,
      "description": model.description
    };
  }
}
