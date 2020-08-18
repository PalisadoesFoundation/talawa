import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/profile_page.dart';

class SwitchOrganization extends StatefulWidget {
  @override
  _SwitchOrganizationState createState() => _SwitchOrganizationState();
}

class _SwitchOrganizationState extends State<SwitchOrganization> {
  Queries _query = Queries();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  FToast fToast;
  int isSelected;
  Preferences preferences = Preferences();
  static String itemIndex;
  List userOrg = [];
  Preferences _pref = Preferences();
  bool _progressBarState = false;

  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast(context);
    fetchUserDetails();
  }

  Future fetchUserDetails() async {
    final String userID = await preferences.getUserId();

    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.fetchUserInfo), variables: {'id': userID}));
    if (result.loading) {
      setState(() {
        _progressBarState = true;
      });
    } else if (result.hasException) {
      print(result.exception);
      setState(() {
        _progressBarState = false;
        showError(result.exception.toString());
      });
    } else if (!result.hasException && !result.loading) {
      setState(() {
        _progressBarState = false;
        userOrg = result.data['users'][0]['joinedOrganizations'];
        if (userOrg.isEmpty) {
          showError("You are not registered to any organization");
        }
      });
    }
  }

  Future switchOrg() async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.mutate(
        MutationOptions(documentNode: gql(_query.fetchOrgById(itemIndex))));
    if (result.hasException) {
      print(result.exception);
      _exceptionToast(result.exception.toString());
    } else if (!result.hasException) {
      _successToast(
          "Switched to " + result.data['organizations'][0]['name'].toString());

      //save new current org id in preference
      final String currentOrgId = result.data['organizations'][0]['_id'];
      await _pref.saveCurrentOrgId(currentOrgId);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => new ProfilePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Switch Organization',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _progressBarState
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: userOrg.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  activeColor: UIData.secondaryColor,
                  groupValue: isSelected,
                  title: Text(userOrg[index]['name'].toString() +
                      '\n' +
                      userOrg[index]['description'].toString()),
                  value: index,
                  onChanged: (val) {
                    setState(() {
                      isSelected = val;
                      itemIndex = userOrg[index]['_id'].toString();
                    });
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.save),
        label: Text("SAVE"),
        backgroundColor: UIData.secondaryColor,
        foregroundColor: Colors.white,
        elevation: 5.0,
        onPressed: () {
          switchOrg();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
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
