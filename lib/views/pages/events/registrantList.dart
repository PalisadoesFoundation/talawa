//flutter packages are called here
import 'package:flutter/material.dart';

//imported the pages here
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFuctions.dart';

// ignore: must_be_immutable
class RegList extends StatefulWidget {
  Map event;

  RegList({
    Key key,
    @required this.event,
  }) : super(key: key);

  @override
  _RegListState createState() => _RegListState();
}

class _RegListState extends State<RegList> {
  Preferences preferences = Preferences();

  ApiFunctions apiFunctions = ApiFunctions();
  List eventTasks = [];

  void initState() {
    super.initState();
    getRegistrants();
  }

  //method to get the list of registrants
  getRegistrants() async {
    final String userID = widget.event['_id'];
    Map result =
        await apiFunctions.gqlquery(Queries().getRegistrantsByEvent(userID));
    setState(() {
      eventTasks = result == null ? [] : result['registrantsByEvent'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return eventTasks.length != 0
        ? ListView.builder(
            itemCount: eventTasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(eventTasks[index]['firstName']),
              );
            })
        : Container(
            child: Center(
                child: Text(
              "No Registrants found",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )),
          );
  }
}
