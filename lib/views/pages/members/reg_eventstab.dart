//flutter packages imported here
import 'package:flutter/material.dart';

//packages for pages are imported here
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/api_functions.dart';
import 'package:talawa/views/widgets/loading.dart';

// ignore: must_be_immutable
class RegisteredEvents extends StatefulWidget {
  RegisteredEvents({
    Key key,
    @required this.member,
  }) : super(key: key);
  Map member;

  @override
  _RegisteredEventsState createState() => _RegisteredEventsState();
}

class _RegisteredEventsState extends State<RegisteredEvents> {
  Preferences preferences = Preferences();

  ApiFunctions apiFunctions = ApiFunctions();
  List userEvents;

  //providing variables with the initial states
  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  //method to get the user details
  getUserDetails() async {
    final String userID = widget.member['_id'].toString();
    final Map result =
        await apiFunctions.gqlquery(Queries().registeredEventsByUser(userID));
    setState(() {
      userEvents =
          result == null ? [] : result['registeredEventsByUser'] as List;
    });
  }

  //the main build starts here
  @override
  Widget build(BuildContext context) {
    return userEvents == null
        ? const Center(
            child: Loading(),
          )
        : userEvents.isNotEmpty
            ? ListView.builder(
                itemCount: userEvents.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text('${userEvents[index]['title']}'),
                  );
                })
            : Container(
                child: const Center(
                    child: Text(
                  "No registered events",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )),
              );
  }
}
