import 'package:flutter/material.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFuctions.dart';

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

  getRegistrants() async {
    final String userID = widget.event['_id'];
    Map result =
        await apiFunctions.gqlquery(Queries().getRegistrantsByEvent(userID));
    // print(result);
    setState(() {
      eventTasks = result == null ? [] : result['registrantsByEvent'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: eventTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(eventTasks[index]['firstName']),
          );
        });
  }
}
