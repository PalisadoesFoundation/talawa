//flutter imported packages
import 'package:flutter/material.dart';

//pages are imported here
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/utils/uidata.dart';

class RemoveMember extends StatefulWidget {
  @override
  _RemoveMemberState createState() => _RemoveMemberState();
}

class _RemoveMemberState extends State<RemoveMember> {
  Preferences _preferences = Preferences();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  AuthController _authController = AuthController();
  List membersList = [];
  List selectedMembers = List();
  Queries _query = Queries();

  //giving initial states to every variable
  @override
  void initState() {
    super.initState();
    viewMembers();
  }

  //method to show the members of the organization
  Future viewMembers() async {
    final String orgId = await _preferences.getCurrentOrgId();

    GraphQLClient _client = graphQLConfiguration.authClient();

    QueryResult result = await _client
        .query(QueryOptions(documentNode: gql(_query.fetchOrgById(orgId))));
    if (result.hasException) {
      print(result.exception);
      //showError(result.exception.toString());
    } else if (!result.hasException) {
      setState(() {
        membersList = result.data['organizations'][0]['members'];
      });
    }
  }

  //method called when a member has to be removed by the admin
  Future removeMembers() async {
    GraphQLClient _client = graphQLConfiguration.authClient();
    final String orgId = await _preferences.getCurrentOrgId();

    QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.removeMember(orgId, selectedMembers))));
    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return removeMembers();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      print(result.exception.toString().substring(16));
    } else if (!result.hasException) {
      print(result.data);
      viewMembers();
    }
  }

  //add or remove selected members from list
  void _onMemberSelected(bool selected, String memberId) {
    if (selected == true) {
      setState(() {
        selectedMembers.add('"$memberId"');
      });
      print(selectedMembers);
    } else {
      setState(() {
        selectedMembers.remove('"$memberId"');
      });
      print(selectedMembers);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Remove Member', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.separated(
        itemCount: membersList.length,
        itemBuilder: (context, index) {
          final members = membersList[index];
          String mId = members['_id'];
          return CheckboxListTile(
            secondary: members['image'] != null
                ? CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        Provider.of<GraphQLConfiguration>(context)
                                .displayImgRoute +
                            members['image']))
                : CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                    child: Text(
                        members['firstName']
                                .toString()
                                .substring(0, 1)
                                .toUpperCase() +
                            members['lastName']
                                .toString()
                                .substring(0, 1)
                                .toUpperCase(),
                        style: TextStyle(
                          color: UIData.primaryColor,
                          fontSize: 22,
                        )),
                  ),
            title: Text(members['firstName'] + ' ' + members['lastName']),
            value: selectedMembers.contains('"$mId"'),
            onChanged: (bool value) {
              _onMemberSelected(value, members['_id'].toString());
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.delete),
        label: Text("REMOVE"),
        backgroundColor: UIData.secondaryColor,
        foregroundColor: Colors.white,
        elevation: 5.0,
        onPressed: () {
          removeMemberDialog();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  //dialog to confirm if the admin really wants to remove the member or not
  void removeMemberDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirmation"),
            content:
                Text("Are you sure you want to remove selected member(s)?"),
            actions: [
              TextButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text("Yes"),
                onPressed: () async {
                  removeMembers();
                },
              )
            ],
          );
        });
  }
}
