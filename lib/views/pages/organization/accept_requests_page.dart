//flutter packages are imported  here
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//pages are imported here
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/globals.dart';

class AcceptRequestsPage extends StatefulWidget {
  @override
  _AcceptRequestsPageState createState() => _AcceptRequestsPageState();
}

class _AcceptRequestsPageState extends State<AcceptRequestsPage> {
  final Queries _query = Queries();
  final Preferences _preferences = Preferences();
  static String itemIndex;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  final AuthController _authController = AuthController();
  List membershipRequestsList = [];
  bool loaded = false;
  bool processing = false;

  @override
  void initState() {
    //setting the initial state for the different variables
    super.initState();
    viewMemberShipRequests(); //this function is called here to get the request that are sent by the users to get the membership
  }

  Future viewMemberShipRequests() async {
    //Same function giving us the way that a administrator can see the request got from the user to get the membership
    final String orgId = await _preferences.getCurrentOrgId();

    final GraphQLClient _client = graphQLConfiguration.authClient();

    final QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.viewMembershipRequest(
            orgId)))); //calling the graphql query to see the membership request
    if (result.hasException) {
      print(result.exception);
      //showError(result.exception.toString());
    } else if (!result.hasException) {
      print(result.data['organizations'][0]['membershipRequests']);

      setState(() {
        membershipRequestsList =
            result.data['organizations'][0]['membershipRequests'] as List;
        loaded = true;
      });

      if (membershipRequestsList.isEmpty) {
        Fluttertoast.showToast(
            msg: 'You have no new requests.', backgroundColor: Colors.red);
      }
    }
  }

  Future acceptMemberShipRequests() async {
    setState(() {
      processing = true;
    });
    //this function give the functionality of accepting the request of the user by the administrator
    final GraphQLClient _client = graphQLConfiguration.authClient();

    final QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.acceptMembershipRequest(itemIndex))));
    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return acceptMemberShipRequests();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      setState(() {
        processing = false;
      });
      Fluttertoast.showToast(
          msg: result.exception.toString().substring(16),
          backgroundColor: Colors.red);
    } else if (!result.hasException) {
      setState(() {
        processing = false;
      });
      Fluttertoast.showToast(msg: 'Success', backgroundColor: Colors.green);
      viewMemberShipRequests();
    }
  }

  Future rejectMemberShipRequests() async {
    setState(() {
      processing = true;
    });
    //this function give the functionality of rejecting the request of the user by the administrator
    final GraphQLClient _client = graphQLConfiguration.authClient();

    final QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.rejectMembershipRequest(itemIndex))));
    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return rejectMemberShipRequests();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      setState(() {
        processing = false;
      });
      Fluttertoast.showToast(
          msg: result.exception.toString().substring(16),
          backgroundColor: Colors.red);
    } else if (!result.hasException) {
      setState(() {
        processing = false;
      });
      Fluttertoast.showToast(msg: 'Success', backgroundColor: Colors.green);
      viewMemberShipRequests();
    }
  }

  @override
  Widget build(BuildContext context) {
    //building the UI page
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membership Requests',
            style: TextStyle(color: Colors.white)),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await viewMemberShipRequests();
        },
        child: (!loaded)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : membershipRequestsList.isEmpty
                ? Center(
                    child: Column(
                      children: const <Widget>[
                        SizedBox(
                          height: 250,
                        ),
                        Text(
                          "No request",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    //Builds list of awaiting membership requests
                    itemCount: membershipRequestsList.length,
                    itemBuilder: (context, index) {
                      final membershipRequests = membershipRequestsList[index];
                      return Card(
                          child: ListTile(
                              leading: membershipRequests['user']['image'] !=
                                      null
                                  ? CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(Provider.of<
                                                  GraphQLConfiguration>(context)
                                              .displayImgRoute +
                                          membershipRequests['user']['image']
                                              .toString()))
                                  : const CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage("assets/images/team.png")),
                              title: Text(
                                  '${membershipRequests['user']['firstName']} ${membershipRequests['user']['lastName']}'),
                              trailing: processing
                                  ? const FittedBox(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Wrap(
                                      spacing: 4,
                                      children: <Widget>[
                                        IconButton(
                                          iconSize: 26.0,
                                          icon: const Icon(Icons.delete),
                                          color: Colors.red,
                                          onPressed: () {
                                            itemIndex =
                                                membershipRequests['_id']
                                                    .toString();
                                            rejectMemberShipRequests();
                                          },
                                        ),
                                        IconButton(
                                          iconSize: 26.0,
                                          icon: const Icon(Icons.check),
                                          color: Colors.green,
                                          onPressed: () {
                                            itemIndex =
                                                membershipRequests['_id']
                                                    .toString();
                                            acceptMemberShipRequests();
                                          },
                                        ),
                                      ],
                                    )));
                    }),
      ),
    );
  }

  Widget showError(BuildContext context, String msg) {
    //function which will be called if there is some error in the program
    return Center(
      child: Text(
        msg,
        style: const TextStyle(fontSize: 16, color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }
}
