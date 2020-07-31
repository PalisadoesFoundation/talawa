import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/views/pages/nav_page.dart';
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
  int isSelected = 0;
  Preferences preferences = Preferences();
  static String itemIndex;
  List userOrg = [];
  
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
    fetchUserDetails();
  }

  Future fetchUserDetails() async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.fetchUserInfo), variables: {'id': userID}));
    if (result.hasException) {
      print(result.exception);
      showError(result.exception.toString());
    } else if (!result.hasException) {
      setState(() {
        userOrg = result.data['users'][0]['joinedOrganizations'];
      });
      print(result.data['users'][0]['joinedOrganizations']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Switch Organization'),
        ),
        body: userOrg.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: <Widget>[
                  ListView.separated(
                    itemCount: userOrg.length,
                    itemBuilder: (context, index) {
                      final userOrganization = userOrg[index];
                      return RadioListTile(
                        groupValue: isSelected,
                        title: Text(userOrganization['name'].toString() +
                            '\n' +
                            userOrganization['description'].toString()),
                        value: index,
                        onChanged: (val) {
                          setState(() {
                            isSelected = val;
                            itemIndex = userOrganization['_id'].toString();
                          });
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                  ),
                ],
              ));
  }

  Widget showError(String msg) {
    return Center(
      child: Text(
        msg,
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }

  _successToast(String msg) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(msg),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }

  _exceptionToast(String msg) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(msg),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }
}
