//flutter packages are called here
import 'package:flutter/material.dart';
import 'package:talawa/model/events.dart';
import 'package:talawa/services/app_localization.dart';

//imported the pages here
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/api_functions.dart';

class RegList extends StatefulWidget {
  const RegList({
    Key key,
    @required this.event,
  }) : super(key: key);

  final EventsModel event;

  @override
  _RegListState createState() => _RegListState();
}

class _RegListState extends State<RegList> {
  Preferences preferences = Preferences();

  ApiFunctions apiFunctions = ApiFunctions();
  List eventTasks;

  @override
  void initState() {
    super.initState();
    getRegistrants();
  }

  //method to get the list of registrants
  Future<List<dynamic>> getRegistrants() async {
    final String userID = widget.event.id.toString();
    final Map result =
        await apiFunctions.gqlquery(Queries().getRegistrantsByEvent(userID));
    //setState(() {

    // ignore: join_return_with_assignment
    eventTasks = result == null ? [] : result['registrantsByEvent'] as List;
    return eventTasks;
  }

  @override
  Widget build(BuildContext context) {
    final task = getRegistrants();
    return Container(
      child: FutureBuilder<List<dynamic>>(
        future: task,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data.isEmpty) {
            return Container(
              child: Center(
                child: Text(
                  AppLocalizations.of(context)
                      .translate("No Registrants found"),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(
                      snapshot.data[index]['firstName'].toString(),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
