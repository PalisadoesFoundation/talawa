import 'package:provider/provider.dart';
import 'package:talawa/model/activity.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/view_models/vm_add_activity.dart';
import 'package:talawa/views/pages/home_page.dart';
import 'package:talawa/views/widgets/_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:talawa/utils/globals.dart';

import 'note_controller.dart';

/*Handles all activity specific routes*/
class ActivityController with ChangeNotifier {
  /* Retrieves all activities | Appends number of users a part of each activity */
  Future<List<Activity>> getActivities(BuildContext context) async {
    //Stores response from API get request
    final response = await http.get(baseRoute + "/activities");

    // If the call to the server was successful, parse the JSON.
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      data = data['activities'];
      return (data as List)
          .map((activity) => new Activity.fromJson(activity))
          .toList();
    }
    // If that call was not successful, display error.
    else {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("unable to fetch activities"),
          duration: Duration(seconds: 5)));
    }
    //Return default activity list.
    return new List<Activity>();
  }

  /* Retrieves an activity based on an activity id */
  Future<Activity> getActivity(BuildContext context, int activityId) async {
    //Stores response from API Request
    final response = await http.get(baseRoute + "/activities/$activityId");

    // If the call to the server was successful, parse the JSON.
    if (response.statusCode == 200) {
      Activity activity = Activity.fromJson(json.decode(response.body));
      return activity;
    }
    // If that call was not successful, throw an error.
    else {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("unable to fetch activity"),
          duration: Duration(seconds: 5)));
    }
    return new Activity();
  }

  /* Retrieves a list of activities based on a specific user */
  Future<List<Activity>> getActivitiesByUser(
      BuildContext context, int userId) async {
    //Stores response from API Request
    final response =
        await http.get(baseRoute + "/activities/fetchActivitiesByUser/$userId");

    // If the call to the server was successful, parse the JSON.
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      data = data['activities'];
      return (data as List)
          .map((activity) => new Activity.fromJson(activity))
          .toList();
    }
    // If that call was not successful, throw an error.
    else {
      // Scaffold.of(context).showSnackBar(SnackBar(
      //     content: Text("unable to fetch activities"),
      //     duration: Duration(seconds: 5)));
    }
    return new List<Activity>();
  }

  /* Retrieves users associated with a specific activity */
  Future<List<User>> getUsersByActivity(
      BuildContext context, int activityId, int userId) async {
    //Stores response from API Request
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
    return new List<User>();
  }

  /* Retrieves users excluding the creator of the activity */
  Future<List<User>> getAvailableUsers(
      BuildContext context, int creator) async {
    //Stores response from API Request
    final response =
        await http.get(baseRoute + "/user/filter/" + creator.toString());
    var data = json.decode(response.body);
    // If the call to the server was successful, parse the JSON.
    if (response.statusCode == 200) {
      data = data['users'];
      return (data as List).map((user) => new User.fromJson(user)).toList();
    }
    // If that call was not successful, handle exception
    else {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(data['message']), duration: Duration(seconds: 5)));
    }
    return new List<User>();
  }

  /* Create an activity */
  Future postActivity(BuildContext context, AddActivityViewModel model) async {
    // Create json request
    Map<String, dynamic> requestBody = {
      "title": model.title,
      "datetime": model.datetime,
      "description": model.description,
      "admin": model.admin,
      "users": model.users
    };
    //Create header definition for request
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      //Stores response from API request
      final response = await http
          .post(baseRoute + '/activities',
              headers: headers, body: jsonEncode(requestBody))
          .timeout(Duration(seconds: 20));
      switch (response.statusCode) {
        case 201:
          {
            //Navigates app back to the activity screen
            Provider.of<NoteController>(context, listen: false)
                .joinRoom(model.title);
            Navigator.of(context).pop();
            notifyListeners();
            return;
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

  Future updateActivity(
      BuildContext context, Activity oldModel, Activity newModel) async {
    var oldModelMap = toMap(oldModel);
    var newModelMap = toMap(newModel);

    //Remove all unchanged attributes from the new model
    oldModelMap.forEach((oldKey, oldAttr) {
      newModelMap.removeWhere((newKey, newAttr) => newAttr == oldAttr);
    });
    //Create request
    Map<String, dynamic> requestBody = {"updates": newModelMap};

    //Create header for request
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      //Stores response from API Request
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

  //Turns activity model into a map object
  Map<String, dynamic> toMap(Activity model) {
    return {
      "title": model.title,
      "datetime": model.datetime,
      "description": model.description
    };
  }
}
