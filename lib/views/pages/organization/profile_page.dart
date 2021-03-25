//flutter packages are  imported here
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//pages are imported here
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/views/pages/organization/join_organization.dart';
import 'package:talawa/views/widgets/about_tile.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/views/pages/organization/organization_settings.dart';
import 'package:talawa/views/widgets/alert_dialog_box.dart';
import 'package:talawa/views/widgets/snackbar.dart';
import 'switch_org_page.dart';

class ProfilePage extends StatefulWidget {
  final bool isCreator;
  final List test;
  ProfilePage({this.isCreator,this.test});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Queries _query = Queries();
  Preferences _preferences = Preferences();
  AuthController _authController = AuthController();
  List userDetails = [];
  List orgAdmin = [];
  List org = [];
  List admins = [];
  List curOrganization = [];
  bool isCreator;
  bool isPublic;
  String creator;
  String userID;
  String orgName;
  OrgController _orgController = OrgController();
  String orgId;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  //providing initial states to the variables
  @override
  void initState() {
    super.initState();
    if(widget.isCreator != null && widget.test != null){
      userDetails = widget.test;
      isCreator = widget.isCreator;
      org = userDetails[0]['joinedOrganizations'];
    }
    //Provider.of<Preferences>(context, listen: false).getCurrentOrgName();
    fetchUserDetails();
  }

  //used to fetch the users details from the server
  Future fetchUserDetails() async {
    orgId = await _preferences.getCurrentOrgId();
    userID = await _preferences.getUserId();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.fetchUserInfo), variables: {'id': userID}));
    if (result.hasException) {
      print(result.exception);
    } else if (!result.hasException) {
      print(result);
      setState(() {
        userDetails = result.data['users'];
        org = userDetails[0]['joinedOrganizations'];
      });
      print(userDetails);
      int notFound = 0;
      for(int i = 0;i<org.length;i++){
        if(org[i]['_id']==orgId){
          break;
        }else{
          notFound++;
        }
      }
      if(notFound==org.length && org.length>0){
        _orgController.setNewOrg(context, org[0]['_id'], org[0]['name']);
        Provider.of<Preferences>(context, listen: false)
            .saveCurrentOrgName(org[0]['name']);
        Provider.of<Preferences>(context, listen: false)
            .saveCurrentOrgId(org[0]['_id']);
        await _preferences.saveCurrentOrgImgSrc(org[0]['image']);
      }
      fetchOrgAdmin();
    }
  }

  //used to fetch Organization Admin details
  Future fetchOrgAdmin() async {
    orgName =await _preferences.getCurrentOrgName();
    orgId = await _preferences.getCurrentOrgId();
    if (orgId != null) {
      GraphQLClient _client = graphQLConfiguration.authClient();
      QueryResult result = await _client
          .query(QueryOptions(documentNode: gql(_query.fetchOrgById(orgId))));
      if (result.hasException) {
        print(result.exception.toString());
      } else if (!result.hasException) {
        print('here');
        curOrganization = result.data['organizations'];
        creator = result.data['organizations'][0]['creator']['_id'];
        isPublic = result.data['organizations'][0]['isPublic'];
        result.data['organizations'][0]['admins']
            .forEach((userId) => admins.add(userId));
        for (int i = 0; i < admins.length; i++) {
          print(admins[i]['_id']);
          if (admins[i]['_id'] == userID) {
            isCreator = true;
            break;
          } else {
            isCreator = false;
          }
        }
      }
    } else {
      isCreator = false;
    }
    setState(() {});
  }

  //function used when someone wants to leave organization
  Future leaveOrg() async {
    List remaindingOrg = [];
    String newOrgId;
    String newOrgName;
    final String orgId = await _preferences.getCurrentOrgId();

    GraphQLClient _client = graphQLConfiguration.authClient();

    QueryResult result = await _client
        .mutate(MutationOptions(documentNode: gql(_query.leaveOrg(orgId))));

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      print('loop');
      return leaveOrg();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      print('exception: ${result.exception.toString()}');
      //_exceptionToast(result.exception.toString().substring(16));
    } else if (!result.hasException && !result.loading) {
      //set org at the top of the list as the new current org
      print('done');
      setState(() {
        remaindingOrg = result.data['leaveOrganization']['joinedOrganizations'];
        if (remaindingOrg.isEmpty) {
          newOrgId = null;
        } else if (remaindingOrg.isNotEmpty) {
          setState(() {
            newOrgId = result.data['leaveOrganization']['joinedOrganizations']
                [0]['_id'];
            newOrgName = result.data['leaveOrganization']['joinedOrganizations']
                [0]['name'];
          });
        }
      });

      _orgController.setNewOrg(context, newOrgId, newOrgName);
      Provider.of<Preferences>(context, listen: false)
          .saveCurrentOrgName(newOrgName);
      Provider.of<Preferences>(context, listen: false)
          .saveCurrentOrgId(newOrgId);
      //  _successToast('You are no longer apart of this organization');
      pushNewScreen(
        context,
        screen: ProfilePage(),
      );
    }
  }

  //main build starts from here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: userDetails.isEmpty || isCreator == null
            ? Center(child: CircularProgressIndicator(key: Key('loading'),))
            : Column(
          key: Key('body'),
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 32.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      color: UIData.primaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                            title: Text("Profile",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.white)),
                            trailing: userDetails[0]['image'] != null
                                ? CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        Provider.of<GraphQLConfiguration>(
                                                    context)
                                                .displayImgRoute +
                                            userDetails[0]['image']))
                                : CircleAvatar(
                                    radius: 45.0,
                                    backgroundColor: Colors.white,
                                    child: Text(
                                        userDetails[0]['firstName']
                                                .toString()
                                                .substring(0, 1)
                                                .toUpperCase() +
                                            userDetails[0]['lastName']
                                                .toString()
                                                .substring(0, 1)
                                                .toUpperCase(),
                                        style: TextStyle(
                                          color: UIData.primaryColor,
                                        )),
                                  )),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                              userDetails[0]['firstName'].toString() +
                                  " " +
                                  userDetails[0]['lastName'].toString(),
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                        ),
                        const SizedBox(height: 5.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                              "Current Organization: " + (orgName??'No Organization Joined'),
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Expanded(
                    child: ListView(
                      children: ListTile.divideTiles(
                        context: context,
                        tiles: [
                          ListTile(
                            key: Key('Update Profile'),
                            title: Text(
                              'Update Profile',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            leading: Icon(
                              Icons.person,
                              color: UIData.secondaryColor,
                            ),
                            onTap: () {},
                          ),
                          org.length == 0
                              ? SizedBox()
                              : ListTile(
                              key: Key('Switch Organization'),
                                  title: Text(
                                    'Switch Organization',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  leading: Icon(
                                    Icons.compare_arrows,
                                    color: UIData.secondaryColor,
                                  ),
                                  onTap: () {
                                    pushNewScreen(
                                      context,
                                      screen: SwitchOrganization(),
                                    );
                                  }),
                          ListTile(
                              key: Key('Join or Create New Organization'),
                              title: Text(
                                'Join or Create New Organization',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              leading: Icon(
                                Icons.business,
                                color: UIData.secondaryColor,
                              ),
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: JoinOrganization(fromProfile: true,),
                                );
                              }),
                          isCreator == null
                              ? SizedBox()
                              : isCreator == true
                                  ? ListTile(
                              key: Key('Organization Settings'),
                              title: Text(
                                        'Organization Settings',
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                      leading: Icon(
                                        Icons.settings,
                                        color: UIData.secondaryColor,
                                      ),
                                      onTap: () {
                                        pushNewScreen(
                                          context,
                                          screen: OrganizationSettings(
                                              creator: creator == userID,
                                              public: isPublic,
                                              organization: curOrganization),
                                        );
                                      })
                                  : org.length==0?SizedBox():ListTile(
                              key: Key('Leave This Organization'),
                              title: Text(
                                        'Leave This Organization',
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                      leading: Icon(
                                        Icons.exit_to_app,
                                        color: UIData.secondaryColor,
                                      ),
                                      onTap: () async {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertBox(
                                                  message:
                                                      "Are you sure you want to leave this organization?",
                                                  function: leaveOrg);
                                            });
                                      }),
                          ListTile(
                            key: Key('Logout'),
                            title: Text(
                              "Logout",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            leading: Icon(
                              Icons.exit_to_app,
                              color: UIData.secondaryColor,
                            ),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertBox(
                                      message:
                                          "Are you sure you want to logout?",
                                      function: () {
                                        _authController.logout(context);
                                      },
                                    );
                                  });
                            },
                          ),
                          MyAboutTile(),
                        ],
                      ).toList(),
                    ),
                  )
                ],
              ));
  }
}
