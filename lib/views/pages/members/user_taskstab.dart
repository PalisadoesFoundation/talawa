//flutter packages are called here
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/model/orgmemeber.dart';
import 'package:talawa/services/app_localization.dart';

//pages are called here
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/api_functions.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/views/widgets/loading.dart';

// ignore: must_be_immutable
class UserTasks extends StatefulWidget {
  UserTasks({
    Key key,
    @required this.member,
  }) : super(key: key);

  Member member;

  @override
  _UserTasksState createState() => _UserTasksState();
}

class _UserTasksState extends State<UserTasks> {
  Preferences preferences = Preferences();

  ApiFunctions apiFunctions = ApiFunctions();
  List userTasks;

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  //getting user details
  Future getUserDetails() async {
    final String userID = widget.member.id.toString();
    final Map result =
        await apiFunctions.gqlquery(Queries().tasksByUser(userID));
    print(result);
    setState(
      () {
        userTasks = result == null ? [] : result['tasksByUser'] as List;
      },
    );
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    } else {
      return;
    }
  }

  //main building starts here
  @override
  Widget build(BuildContext context) {
    return userTasks == null
        ? Container(
            key: const Key("User Task Loading"),
            child: Center(
              child: Loading(
                key: UniqueKey(),
                isCurrentOrgNull: false,
                emptyContentIcon: Icons.work_outline_rounded,
                emptyContentMsg: AppLocalizations.of(context)
                    .translate('No Tasks found, Create One!'),
                refreshFunction: getUserDetails,
              ),
            ),
          )
        : userTasks.isNotEmpty
            ? Container(
                key: const Key(
                  "User Task Exists",
                ),
                child: ListView.builder(
                    itemCount: userTasks.length,
                    itemBuilder: (context, index) {
                      String title =
                          "${AppLocalizations.of(context).translate("Title")}: ${userTasks[index]["title"]}";
                      title += userTasks[index]["event"] != null
                          ? '\n${AppLocalizations.of(context).translate("Event")}: ${userTasks[index]["event"]["title"]}'
                          : "";
                      String description =
                          userTasks[index]["description"].toString();
                      description += userTasks[index]["deadline"] != null
                          ? ' \n${AppLocalizations.of(context).translate("Due Date")}: ${DateFormat("dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(userTasks[index]["deadline"].toString())))}'
                          : '\n${AppLocalizations.of(context).translate("Due Date")}: N/A';
                      return Card(
                          child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              title,
                            ),
                            subtitle: Text(
                              '${AppLocalizations.of(context).translate("Description")}: $description',
                            ),
                            contentPadding: EdgeInsets.fromLTRB(
                              SizeConfig.safeBlockHorizontal * 2,
                              SizeConfig.safeBlockVertical,
                              SizeConfig.safeBlockHorizontal * 2,
                              SizeConfig.safeBlockVertical,
                            ),
                          ),
                        ],
                      ));
                    }))
            : Container(
                key: const Key(
                  "User Task Not Exists",
                ),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).translate("No Tasks found"),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
  }
}
