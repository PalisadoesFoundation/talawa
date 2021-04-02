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
  Future<List<dynamic>> getRegistrants() async {
    final String userID = widget.event['_id'];
    Map result =
        await apiFunctions.gqlquery(Queries().getRegistrantsByEvent(userID));
    //setState(() {

    // });
    eventTasks = result == null ? [] : result['registrantsByEvent'];
    return eventTasks;
  }

  @override
  Widget build(BuildContext context) {
    var task = getRegistrants();
    return Container(
      child: FutureBuilder<List<dynamic>>(
          future: task,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.data.length == 0) {
              return Container(
                child: Center(
                    child: Text(
                  "No Registrants found",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )),
              );
            } else {
              return SingleChildScrollView(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(snapshot.data[index]['firstName']),
                      );
                    }),
              );
            }
          }),
    );
  }
}
