import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({Key key}) : super(key: key);
  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  Queries _query = Queries();
  Preferences _preferences = Preferences();
  AuthController _authController = AuthController();
  List userDetails = [];
  List orgAdmin = [];
  List org = [];
  bool isCreator;
  OrgController _orgController = OrgController();

  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  //providing initial states to the variables
  @override
  void initState() {
    super.initState();
    Provider.of<Preferences>(context, listen: false).getCurrentOrgName();
    fetchUserDetails();
  }

  //used to fetch the users details from the server
  Future fetchUserDetails() async {
    final String userID = await _preferences.getUserId();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.fetchUserInfo), variables: {'id': userID}));
    if (result.hasException) {
      print(result.exception);
    } else if (!result.hasException) {
      setState(() {
        userDetails = result.data['users'];
        org = userDetails.first['joinedOrganizations'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  expandedHeight: 80,
                  backgroundColor: Colors.white,
                  floating: true,
                  snap: false,
                  stretch: true,
                  forceElevated: false,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: Colors.white,
                      alignment: Alignment.bottomCenter,
                      height: 80,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                'Update Profile',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              subtitle: Text(
                                'Keep your profile upto date',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: TextField(
                      //controller: _phoneController,
                      style: TextStyle(fontSize: 20),
                      keyboardType: TextInputType.phone,
                      enableSuggestions: true,
                      cursorRadius: Radius.circular(10),
                      cursorColor: Colors.blue[800],
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        labelText: 'First Name',
                        counterText: '',
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            icon: Icon(
              Icons.update,
              color: Colors.white,
            ),
            label: Text(
              'Update Profile',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
