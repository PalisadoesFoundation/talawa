import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/controllers/organisation_controller.dart';
import 'package:provider/provider.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:talawa/utils/uidata.dart';

class Organizations extends StatefulWidget {
  Organizations({Key key}) : super(key: key);

  @override
  _OrganizationsState createState() => _OrganizationsState();
}

class _OrganizationsState extends State<Organizations> {
  List organizationsList = [];
  List membersList = [];
  int isSelected = 0;
  String currentOrgID;
  Preferences preferences = Preferences();

  initState() {
    super.initState();
    getEvents();
    getCurrentOrgId();
  }

  getCurrentOrgId() async {
    final orgId = await preferences.getCurrentOrgId();
    setState(() {
      currentOrgID = orgId;
    });
    // print(currentOrgID);
  }

  Future<List> getEvents() async {
    ApiFunctions apiFunctions = ApiFunctions();
    Map result =
        await apiFunctions.gqlquery(Queries().fetchOrgById(currentOrgID));
    // print(result);
    setState(() {
      organizationsList = result == null ? [] : result['organizations'];
      membersList = organizationsList[0]['members'];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Members',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: membersList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: membersList.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  title: Text(membersList[index]['firstName'].toString() +
                      ' ' +
                      membersList[index]['lastName'].toString()),
                  subtitle: Text(membersList[index]['email'].toString()),
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white54,
                    ),
                    backgroundColor: UIData.secondaryColor,
                  ),
                  trailing: Icon(Icons.menu),
                ));
              },
            ),
    );
  }
}
