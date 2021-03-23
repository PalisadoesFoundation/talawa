//flutter packages are called here
import 'package:flutter/material.dart';

//pages are called here
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/organization/profile_page.dart';

class SwitchOrganization extends StatefulWidget {
  @override
  _SwitchOrganizationState createState() => _SwitchOrganizationState();
}

class _SwitchOrganizationState extends State<SwitchOrganization> {
  Queries _query = Queries();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  FToast fToast;
  int visit = 0;
  String orgId;
  int isSelected;
  String itemIndex;
  List userOrg = [];
  Preferences _pref = Preferences();
  bool _progressBarState = false;

  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
  }

  //giving initial state to the variables
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    fetchUserDetails();
  }

  //method used to fetch the user details from the server
  Future fetchUserDetails() async {
    final String userID = await _pref.getUserId();

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
        print(userOrg);
        if (userOrg.isEmpty) {
          showError("You are not registered to any organization");
        }
      });
    }
  }

  //this method allows user to change the organization if he wants to
  Future switchOrg() async {
    if (userOrg[isSelected]['_id'] == orgId) {
      _successToast("Switched to " + userOrg[isSelected]['name'].toString());
      pushNewScreen(
        context,
        screen: ProfilePage(),
      );
    } else {
      GraphQLClient _client = graphQLConfiguration.clientToQuery();

      QueryResult result = await _client.mutate(
          MutationOptions(documentNode: gql(_query.fetchOrgById(itemIndex))));
      if (result.hasException) {
        print(result.exception);
        _exceptionToast(result.exception.toString());
      } else if (!result.hasException) {
        _successToast("Switched to " +
            result.data['organizations'][0]['name'].toString());

        //save new current org in preference
        final String currentOrgId = result.data['organizations'][0]['_id'];
        await _pref.saveCurrentOrgId(currentOrgId);
        final String currentOrgImgSrc =
            result.data['organizations'][0]['image'];
        await _pref.saveCurrentOrgImgSrc(currentOrgImgSrc);
        final String currentOrgName = result.data['organizations'][0]['name'];
        await _pref.saveCurrentOrgName(currentOrgName);
        pushNewScreen(
          context,
          screen: ProfilePage(),
        );
      }
    }
  }

  // it is used to get the current organization id
  getCurrentOrg() async {
    orgId = await Provider.of<Preferences>(context).getCurrentOrgId();
    setState(() {});
  }

//the build starts from here
  @override
  Widget build(BuildContext context) {
    if (visit == 0) {
      visit++;
      getCurrentOrg();
    }
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
              padding: EdgeInsets.only(top: 10.0),
              itemCount: userOrg.length,
              itemBuilder: (context, index) {
                if (userOrg[index]['_id'] == orgId) {
                  isSelected = index;
                }
                return RadioListTile(
                  secondary: userOrg[index]['image'] != null
                      ? CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              Provider.of<GraphQLConfiguration>(context)
                                      .displayImgRoute +
                                  userOrg[index]['image']))
                      : CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage("assets/images/team.png")),
                  activeColor: UIData.secondaryColor,
                  groupValue: isSelected,
                  title: Text(userOrg[index]['name'].toString() +
                      '\n' +
                      userOrg[index]['description'].toString()),
                  value: index,
                  onChanged: (val) {
                    setState(() {
                      orgId = null;
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

  //widget to show error if there is some error in the lines
  Widget showError(String msg) {
    return Center(
      child: Text(
        msg,
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }

  //the method which is called when the result is successful
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

  //the method is called when the result is an exception
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
