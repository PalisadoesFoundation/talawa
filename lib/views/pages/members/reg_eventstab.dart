//flutter packages imported here
import 'package:flutter/material.dart';
import 'package:talawa/model/orgmemeber.dart';
import 'package:talawa/services/app_localization.dart';

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
  Member member;

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
  Future getUserDetails() async {
    final String userID = widget.member.id.toString();
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
        ? Center(
            child: Loading(
              key: UniqueKey(),
              isCurrentOrgNull: false,
              emptyContentIcon: Icons.event_note_outlined,
              emptyContentMsg: AppLocalizations.of(context)
                  .translate('No registered events, Join an event!'),
              refreshFunction: getUserDetails,
            ),
          )
        : userEvents.isNotEmpty
            ? ListView.builder(
                itemCount: userEvents.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(
                      '${userEvents[index]['title']}',
                    ),
                  );
                },
              )
            : Container(
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)
                        .translate("No registered events"),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
  }
}
