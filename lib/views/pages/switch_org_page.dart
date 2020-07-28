import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/views/pages/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SwitchOrganization extends StatefulWidget {
  @override
  _SwitchOrganizationState createState() => _SwitchOrganizationState();
}

class _SwitchOrganizationState extends State<SwitchOrganization> {
  Queries _query = Queries();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  FToast fToast;
  String userID;
  int radioValue = -1;
  Preferences preferences = Preferences();

  @override
  void initState() {
    super.initState();
    fToast = FToast(context);
    getUser();
  }

  getUser() async {
    final id = await preferences.getUserId();
    setState(() {
      userID = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Switch Organization'),
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.blue),
                onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => new HomePage()))),
            backgroundColor: Color(0xffF3F6FF),
            elevation: 0.0,
            brightness: Brightness.light),
        body: Query(
            options: QueryOptions(
                documentNode: gql(_query.fetchUserInfo),
                variables: {'id': userID}),
            builder: (QueryResult result,
                {VoidCallback refetch, FetchMore fetchMore}) {
              if (result.hasException) {
                print(result.exception);
                return Center(
                  child: Text(
                    result.exception.toString(),
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                );
              } else if (result.loading) {
                return Center(child: CircularProgressIndicator());
              }
              List userOrgDetails = result.data['users'];

              return ListView.builder(
                  itemCount: userOrgDetails.length,
                  itemBuilder: (context, index) {
                    final userOrg = userOrgDetails[index];

                    return Column(children: <Widget>[
                      RadioListTile(
                        groupValue: radioValue,
                        title: Text(userOrg['firstName'].toString()),
                        subtitle: Text(userOrg['lastName'].toString()),
                        value: 0,
                        onChanged: (val) {
                          setState(() {
                            radioValue = val;
                          });
                        },
                      ),
                    ]);
                  });
            }));
  }
}
