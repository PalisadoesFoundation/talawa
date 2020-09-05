import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/globals.dart';

class AcceptRequestsPage extends StatefulWidget {
  @override
  _AcceptRequestsPageState createState() => _AcceptRequestsPageState();
}

class _AcceptRequestsPageState extends State<AcceptRequestsPage> {
  Queries _query = Queries();
  Preferences _preferences = Preferences();
  static String itemIndex;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  FToast fToast;
  AuthController _authController = AuthController();
  List membershipRequestsList = [];

  @override
  void initState() {
    super.initState();
    fToast = FToast(context);
    viewMemberShipRequests();
  }

  Future viewMemberShipRequests() async {
    final String orgId = await _preferences.getCurrentOrgId();

    GraphQLClient _client = graphQLConfiguration.authClient();

    QueryResult result = await _client.query(
        QueryOptions(documentNode: gql(_query.viewMembershipRequest(orgId))));
    if (result.hasException) {
      print(result.exception);
      //showError(result.exception.toString());
    } else if (!result.hasException) {
      print(result.data['organizations'][0]['membershipRequests']);

      setState(() {
        membershipRequestsList =
            result.data['organizations'][0]['membershipRequests'];
      });

      if (membershipRequestsList.isEmpty) {
        showError(context, 'You have no new requests.');
      }
    }
  }

  Future acceptMemberShipRequests() async {
    GraphQLClient _client = graphQLConfiguration.authClient();

    QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.acceptMembershipRequest(itemIndex))));
    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return acceptMemberShipRequests();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      _exceptionToast(result.exception.toString().substring(16));
    } else if (!result.hasException) {
      print(result.data);
      _successToast('Success');
      viewMemberShipRequests();
    }
  }

  Future rejectMemberShipRequests() async {
    GraphQLClient _client = graphQLConfiguration.authClient();

    QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.rejectMembershipRequest(itemIndex))));
    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return rejectMemberShipRequests();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      _exceptionToast(result.exception.toString().substring(16));
    } else if (!result.hasException) {
      print(result.data);
      _successToast('Success');

      viewMemberShipRequests();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Membership Requests',
              style: TextStyle(color: Colors.white)),
        ),
        body: ListView.builder(
          itemCount: membershipRequestsList.length,
          itemBuilder: (context, index) {
            final membershipRequests = membershipRequestsList[index];
            return Card(
              child: ListTile(
                leading: membershipRequests['user']['image'] != null
                    ? CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            Provider.of<GraphQLConfiguration>(context)
                                    .displayImgRoute +
                                membershipRequests['user']['image']))
                    : CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/team.png")),
                title: Text(membershipRequests['user']['firstName'] +
                    ' ' +
                    membershipRequests['user']['lastName']),
                trailing: Wrap(
                  spacing: 4,
                  children: <Widget>[
                    IconButton(
                      iconSize: 26.0,
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        itemIndex = membershipRequests['_id'];
                        rejectMemberShipRequests();
                      },
                    ),
                    IconButton(
                      iconSize: 26.0,
                      icon: Icon(Icons.check),
                      color: Colors.green,
                      onPressed: () {
                        itemIndex = membershipRequests['_id'];
                        acceptMemberShipRequests();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget showError(BuildContext context, String msg) {
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
