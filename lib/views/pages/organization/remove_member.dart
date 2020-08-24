import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/GraphAPI.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/utils/uidata.dart';

class RemoveMember extends StatefulWidget {
  @override
  _RemoveMemberState createState() => _RemoveMemberState();
}

class _RemoveMemberState extends State<RemoveMember> {
  Preferences _preferences = Preferences();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  GraphAPI _graphAPI = GraphAPI();
  List membersList = [];
  List selectedMembers = List();
  Queries _query = Queries();
  bool _isChecked = false;
  @override
  void initState() {
    super.initState();
    viewMembers();
  }

  Future viewMembers() async {
    final String orgId = await _preferences.getCurrentOrgId();
    final String userId = await _preferences.getUserId();

    GraphQLClient _client = graphQLConfiguration.authClient();

    QueryResult result = await _client
        .query(QueryOptions(documentNode: gql(_query.viewMembers(orgId))));
    if (result.hasException) {
      print(result.exception);
      //showError(result.exception.toString());
    } else if (!result.hasException) {
      print(result.data['organizations'][0]['members']);

      setState(() {
        membersList = result.data['organizations'][0]['members'];
      });
    }
  }

  void _onMemberSelected(bool selected, memberId) {
    if (selected == true) {
      setState(() {
        selectedMembers.add(memberId);
      });
      print(selectedMembers);
    } else {
      setState(() {
        selectedMembers.remove(memberId);
      });
      print(selectedMembers);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Remove Member',
              style: TextStyle(color: Colors.white)),
        ),
        body: ListView.separated(
          itemCount: membersList.length,
          itemBuilder: (context, index) {
            final members = membersList[index];
            return CheckboxListTile(
              secondary: members['image'] != null
                  ? CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage(displayImgRoute + members['image']))
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
              value: selectedMembers.contains(members['_id']),
              onChanged: (bool value) {
                _onMemberSelected(value, members['_id']);
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ));
  }
}
