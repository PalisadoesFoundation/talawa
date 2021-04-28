import 'dart:io';
//flutter packages are imported here
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Pages are imported here
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talawa/views/pages/home_page.dart';
import 'package:talawa/views/pages/organization/profile_page.dart';
import 'package:talawa/views/widgets/loading.dart';

import 'create_organization.dart';

class JoinOrganization extends StatefulWidget {
  const JoinOrganization({this.msg, this.fromProfile = false});
  final bool fromProfile;
  final String msg;
  @override
  _JoinOrganizationState createState() => _JoinOrganizationState();
}

class _JoinOrganizationState extends State<JoinOrganization> {
  final Queries _query = Queries();
  final Preferences _pref = Preferences();
  String token;
  static String itemIndex;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  FToast fToast;
  List organizationInfo = [];
  List filteredOrgInfo = [];
  List joinedOrg = [];
  final AuthController _authController = AuthController();
  String isPublic;
  TextEditingController searchController = TextEditingController();
  bool _isLoaderActive = false;
  bool disposed = false;
  int loadingIndex = -1;

  // Variables for filtering out alread joined
  // and created organizations.
  String currentUserId;
  List joinedOrganizations = [];
  List joinedOrganizationsIds = [];

  @override
  void initState() {
    //creating the initial state for all the variables
    super.initState();
    fToast = FToast();
    fToast.init(context);
    fetchOrg();
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  // Function for getting the current user id.
  Future<void> getCurrentUserId() async {
    currentUserId = await _pref.getUserId();
  }

  void searchOrgName(String orgName) {
    //it is the search bar to search the organization
    filteredOrgInfo.clear();
    if (orgName.isNotEmpty) {
      for (int i = 0; i < organizationInfo.length; i++) {
        final String name = organizationInfo[i]['name'].toString();
        if (name.toLowerCase().contains(orgName.toLowerCase())) {
          setState(() {
            filteredOrgInfo.add(organizationInfo[i]);
          });
        }
      }
    } else {
      setState(() {
        filteredOrgInfo.add(organizationInfo);
      });
    }
  }

  Future fetchOrg() async {
    // Get current User Id.
    getCurrentUserId();

    //function to fetch the org from the server
    final GraphQLClient _client = graphQLConfiguration.authClient();

    final QueryResult result = await _client
        .query(QueryOptions(documentNode: gql(_query.fetchOrganizations)));

    // Get the details of the current user.
    final QueryResult userDetailsResult = await _client.query(QueryOptions(
        documentNode: gql(_query.fetchUserInfo),
        variables: {'id': currentUserId}));

    if (result.hasException || userDetailsResult.hasException) {
      print(result.exception);
      showError(result.exception.toString());
    } else if (!result.hasException &&
        !disposed &&
        !userDetailsResult.hasException) {
      setState(() {
        organizationInfo = result.data['organizations'] as List;

        // Get the details of joined organizations.
        joinedOrganizations =
            userDetailsResult.data['users'][0]['joinedOrganizations'] as List;

        // Get the id's of joined organizations.
        joinedOrganizations.forEach((element) {
          joinedOrganizationsIds.add(element['_id']);
        });

        // Filtering out organizations that are created by current user.
        organizationInfo = organizationInfo
            .where((element) => element['admins'][0]['_id'] != currentUserId)
            .toList();

        // Filtering out organizations that are already joined by user.
        joinedOrganizationsIds.forEach((e) {
          print(e);
          organizationInfo =
              organizationInfo.where((element) => element['_id'] != e).toList();
        });
      });
    }
  }

  Future joinPrivateOrg() async {
    //function called if the person wants to enter a private organization
    final GraphQLClient _client = graphQLConfiguration.authClient();

    final QueryResult result = await _client.mutate(MutationOptions(
        documentNode: gql(_query.sendMembershipRequest(itemIndex))));

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return joinPrivateOrg();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      _exceptionToast(result.exception.toString().substring(16));
    } else if (!result.hasException && !result.loading) {
      print(result.data);
      _successToast("Request Sent to Organization Admin");

      if (widget.fromProfile) {
        Navigator.pop(context);
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomePage(
            openPageIndex: 4,
          ),
        ));
      }
    }
  }

  Future joinPublicOrg(String orgName) async {
    //function which will be called if the person wants to join the organization which is not private
    final GraphQLClient _client = graphQLConfiguration.authClient();

    print(orgName);

    final QueryResult result = await _client
        .mutate(MutationOptions(documentNode: gql(_query.getOrgId(itemIndex))));

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      _exceptionToast(result.exception.toString().substring(16));
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      _exceptionToast(result.exception.toString().substring(16));
    } else if (!result.hasException && !result.loading) {
      setState(() {
        joinedOrg = result.data['joinPublicOrganization']['joinedOrganizations']
            as List;
      });

      //set the default organization to the first one in the list

      if (joinedOrg.length == 1) {
        final String currentOrgId = result.data['joinPublicOrganization']
                ['joinedOrganizations'][0]['_id']
            .toString();
        await _pref.saveCurrentOrgId(currentOrgId);
        final String currentOrgImgSrc = result.data['joinPublicOrganization']
                ['joinedOrganizations'][0]['image']
            .toString();
        await _pref.saveCurrentOrgImgSrc(currentOrgImgSrc);
        final String currentOrgName = result.data['joinPublicOrganization']
                ['joinedOrganizations'][0]['name']
            .toString();
        await _pref.saveCurrentOrgName(currentOrgName);
      } else {
        // If there are multiple number of organizations.
        for (int i = 0; i < joinedOrg.length; i++) {
          if (joinedOrg[i]['name'] == orgName) {
            final String currentOrgId = result.data['joinPublicOrganization']
                    ['joinedOrganizations'][i]['_id']
                .toString();
            await _pref.saveCurrentOrgId(currentOrgId);
            final String currentOrgImgSrc = result
                .data['joinPublicOrganization']['joinedOrganizations'][i]
                    ['image']
                .toString();
            await _pref.saveCurrentOrgImgSrc(currentOrgImgSrc);
            final String currentOrgName = result.data['joinPublicOrganization']
                    ['joinedOrganizations'][i]['name']
                .toString();
            await _pref.saveCurrentOrgName(currentOrgName);
          }
        }
      }
      _successToast("Success!");

      //Navigate user to newsfeed
      if (widget.fromProfile) {
        pushNewScreen(
          context,
          screen: const HomePage(
            openPageIndex: 4,
          ),
          withNavBar: false,
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomePage(
              openPageIndex: 4,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Organization',
            style: TextStyle(color: Colors.white)),
      ),
      body: organizationInfo.isEmpty
          ? Center(
              child: Loading(
              key: UniqueKey(),
            ))
          : Container(
              color: const Color(0xffF3F6FF),
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 0.75,
                  horizontal: SizeConfig.safeBlockHorizontal * 4),
              child: Column(
                children: <Widget>[
                  const Text(
                    "Welcome, \nJoin or Create your organization to get started",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontStyle: FontStyle.normal),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 2,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      searchOrgName(value);
                    },
                    controller: searchController,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(5),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0.0),
                        ),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Icon(Icons.search, color: Colors.black),
                        ),
                        hintText: "Search Organization Name"),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 2),
                  Expanded(
                      child: Container(
                          color: const Color(0xffF3F6FF),
                          child: searchController.text.isNotEmpty
                              ? ListView.builder(
                                  itemCount: filteredOrgInfo.length,
                                  itemBuilder: (context, index) {
                                    final organization = filteredOrgInfo[index];
                                    return Card(
                                      child: ListTile(
                                        leading: organization['image'] != null
                                            ? CircleAvatar(
                                                radius: SizeConfig
                                                        .safeBlockVertical *
                                                    3.75,
                                                backgroundImage: NetworkImage(
                                                    Provider.of<GraphQLConfiguration>(
                                                                context)
                                                            .displayImgRoute +
                                                        organization['image']
                                                            .toString()))
                                            : CircleAvatar(
                                                radius: SizeConfig
                                                        .safeBlockVertical *
                                                    3.75,
                                                backgroundImage: const AssetImage(
                                                    "assets/images/team.png")),
                                        title: organization['isPublic']
                                                    .toString() !=
                                                'false'
                                            ? Row(
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      organization['name']
                                                          .toString(),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  const Icon(Icons.lock_open,
                                                      color: Colors.green,
                                                      size: 16)
                                                ],
                                              )
                                            : Row(
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      organization['name']
                                                          .toString(),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  const Icon(Icons.lock,
                                                      color: Colors.red,
                                                      size: 16)
                                                ],
                                              ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                                organization['description']
                                                    .toString(),
                                                maxLines: 2,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            Text(
                                                'Created by: ${organization['creator']['firstName']} ${organization['creator']['lastName']}',
                                                maxLines: 2,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ],
                                        ),
                                        trailing: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(UIData.primaryColor),
                                            shape: MaterialStateProperty.all<
                                                    OutlinedBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            )),
                                          ),
                                          onPressed: () {
                                            itemIndex =
                                                organization['_id'].toString();
                                            if (organization['isPublic']
                                                    .toString() ==
                                                'false') {
                                              setState(() {
                                                isPublic = 'false';
                                              });
                                            } else {
                                              setState(() {
                                                isPublic = 'true';
                                              });
                                            }
                                            confirmOrgDialog(
                                                organization['name'].toString(),
                                                index);
                                          },
                                          child: _isLoaderActive == true &&
                                                  loadingIndex == index
                                              ? SizedBox(
                                                  width: SizeConfig
                                                          .safeBlockHorizontal *
                                                      5,
                                                  height: SizeConfig
                                                          .safeBlockVertical *
                                                      2.5,
                                                  child:
                                                      const CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            Colors.white),
                                                    strokeWidth: 3,
                                                    backgroundColor:
                                                        Colors.black,
                                                  ))
                                              : const Text("JOIN"),
                                        ),
                                        isThreeLine: true,
                                      ),
                                    );
                                  })
                              : ListView.builder(
                                  itemCount: organizationInfo.length,
                                  itemBuilder: (context, index) {
                                    final organization =
                                        organizationInfo[index];
                                    return Card(
                                      child: ListTile(
                                        leading: organization['image'] != null
                                            ? CircleAvatar(
                                                radius: SizeConfig
                                                        .safeBlockVertical *
                                                    3.75,
                                                backgroundImage: NetworkImage(
                                                    Provider.of<GraphQLConfiguration>(
                                                                context)
                                                            .displayImgRoute +
                                                        organization['image']
                                                            .toString()))
                                            : CircleAvatar(
                                                radius: SizeConfig
                                                        .safeBlockVertical *
                                                    3.75,
                                                backgroundImage: const AssetImage(
                                                    "assets/images/team.png")),
                                        title: organization['isPublic']
                                                    .toString() !=
                                                'false'
                                            ? Row(
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      organization['name']
                                                          .toString(),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Icon(Icons.lock_open,
                                                      color: Colors.green,
                                                      size: SizeConfig
                                                              .safeBlockVertical *
                                                          2)
                                                ],
                                              )
                                            : Row(
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      organization['name']
                                                          .toString(),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Icon(Icons.lock,
                                                      color: Colors.red,
                                                      size: SizeConfig
                                                              .safeBlockVertical *
                                                          2)
                                                ],
                                              ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                                organization['description']
                                                    .toString(),
                                                maxLines: 2,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            Text(
                                                'Created by: ${organization['creator']['firstName']} ${organization['creator']['lastName']}',
                                                maxLines: 2,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ],
                                        ),
                                        trailing: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(UIData.primaryColor),
                                            shape: MaterialStateProperty.all<
                                                    OutlinedBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            )),
                                          ),
                                          onPressed: () {
                                            itemIndex =
                                                organization['_id'].toString();
                                            if (organization['isPublic']
                                                    .toString() ==
                                                'false') {
                                              setState(() {
                                                isPublic = 'false';
                                              });
                                            } else {
                                              setState(() {
                                                isPublic = 'true';
                                              });
                                            }
                                            confirmOrgDialog(
                                                organization['name'].toString(),
                                                index);
                                          },
                                          child: _isLoaderActive == true &&
                                                  loadingIndex == index
                                              ? SizedBox(
                                                  width: SizeConfig
                                                          .safeBlockHorizontal *
                                                      5,
                                                  height: SizeConfig
                                                          .safeBlockVertical *
                                                      2.5,
                                                  child:
                                                      const CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            Colors.white),
                                                    strokeWidth: 3,
                                                    backgroundColor:
                                                        Colors.black,
                                                  ))
                                              : const Text("JOIN"),
                                        ),
                                        isThreeLine: true,
                                      ),
                                    );
                                  })))
                ],
              )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UIData.secondaryColor,
        foregroundColor: Colors.white,
        elevation: 5.0,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreateOrganization(
                    isFromProfile: widget.fromProfile,
                  )));
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void confirmOrgDialog(String orgName, int index) {
    //this is the pop up shown when the confirmation is required
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        useRootNavigator: false,
        builder: (_) => CupertinoAlertDialog(
          title: const Text("Confirmation"),
          content:
              const Text("Are you sure you want to join this organization?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
            TextButton(
              onPressed: () async {
                setState(() {
                  loadingIndex = index;
                  _isLoaderActive = true;
                });
                Navigator.of(context).pop();
                if (isPublic == 'true') {
                  await joinPublicOrg(orgName).whenComplete(() => setState(() {
                        loadingIndex = -1;
                        _isLoaderActive = false;
                      }));
                } else if (isPublic == 'false') {
                  await joinPrivateOrg().whenComplete(() => setState(() {
                        loadingIndex = -1;
                        _isLoaderActive = false;
                      }));
                }
              },
              child: const Text("Yes"),
            )
          ],
        ),
      );
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirmation"),
              content: const Text(
                  "Are you sure you want to join this organization?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"),
                ),
                TextButton(
                  onPressed: () async {
                    setState(() {
                      loadingIndex = index;
                      _isLoaderActive = true;
                    });
                    Navigator.of(context).pop();
                    if (isPublic == 'true') {
                      await joinPublicOrg(orgName)
                          .whenComplete(() => setState(() {
                                loadingIndex = -1;
                                _isLoaderActive = false;
                              }));
                    } else if (isPublic == 'false') {
                      await joinPrivateOrg().whenComplete(() => setState(() {
                            loadingIndex = -1;
                            _isLoaderActive = false;
                          }));
                    }
                  },
                  child: const Text("Yes"),
                )
              ],
            );
          });
    }
  }

  Widget showError(String msg) {
    return Center(
      child: Text(
        msg,
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }

  _successToast(String msg) {
    final Widget toast = Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 5,
          vertical: SizeConfig.safeBlockVertical * 1.5),
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
      toastDuration: const Duration(seconds: 3),
    );
  }

  _exceptionToast(String msg) {
    final Widget toast = Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 6,
          vertical: SizeConfig.safeBlockVertical * 1.75),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Text(msg),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
    );
  }
}
