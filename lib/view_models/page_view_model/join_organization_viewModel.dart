import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/view_models/base_model.dart';
import 'package:talawa/views/pages/organization/profile_page.dart';

import '../../locator.dart';

class JoinOrgnizationViewModel extends BaseModel {
  final Queries _query = Queries();
  final Preferences _pref = Preferences();
  String token;
  String _itemIndex;
  GraphQLConfiguration graphQLConfiguration = locator<GraphQLConfiguration>();
  FToast fToast;
  List _organizationInfo = [];
  final List _filteredOrgInfo = [];
  List joinedOrg = [];
  final AuthController _authController = AuthController();
  String _isPublic;
  final String _fetchingOrgError = "";
  final bool _hasFetchingOrgError = false;
  final String _sendingRequestToOrgError = "";
  String _currentUserId = "";
  List joinedOrganizations = [];
  List joinedOrganizationsIds = [];
  bool _isLoaderActive = false;
  int _loadingIndex = -1;

  bool disposed = false;

  String get currentUserId => _currentUserId;
  String get fetchingOrgError => _fetchingOrgError;
  bool get hasFetchingOrgError => _hasFetchingOrgError;
  String get sendingRequestToOrgError => _sendingRequestToOrgError;

  bool get isLoaderActive => _isLoaderActive;
  int get loadingIndex => _loadingIndex;

  List get organizationInfo => _organizationInfo;
  List get filteredOrgInfo => _filteredOrgInfo;

  String get isPublic => _isPublic;
  String get itemIndex => _itemIndex;

  void initialise(BuildContext context) {
    fToast = FToast();
    fToast.init(context);
    fetchOrg();
  }

  void setItemIndex(String itemIdx) {
    _itemIndex = itemIdx;
    notifyListeners();
  }

  void setIsPublic(String str) {
    _isPublic = str;
    notifyListeners();
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

  void confirmOrgDialog(String orgName, int index, BuildContext context) {
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
                _loadingIndex = index;
                _isLoaderActive = true;
                notifyListeners();
                Navigator.of(context).pop();
                if (isPublic == 'true') {
                  await joinPublicOrg(context, orgName).whenComplete(() {
                    _loadingIndex = -1;
                    _isLoaderActive = false;
                    notifyListeners();
                  });
                } else if (isPublic == 'false') {
                  await joinPrivateOrg(context).whenComplete(() {
                    _loadingIndex = -1;
                    _isLoaderActive = false;
                    notifyListeners();
                  });
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
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text("Confirmation"),
              content: const Text(
                  "Are you sure you want to join this organization?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text("Close"),
                ),
                TextButton(
                  onPressed: () async {
                    _loadingIndex = index;
                    _isLoaderActive = true;
                    notifyListeners();
                    Navigator.of(ctx).pop();
                    if (isPublic == 'true') {
                      await joinPublicOrg(context, orgName).whenComplete(() {
                        _loadingIndex = -1;
                        _isLoaderActive = false;
                        notifyListeners();
                      });
                    } else if (isPublic == 'false') {
                      await joinPrivateOrg(context).whenComplete(() {
                        _loadingIndex = -1;
                        _isLoaderActive = false;
                        notifyListeners();
                      });
                    }
                  },
                  child: const Text("Yes"),
                )
              ],
            );
          });
    }
  }

  successToast(String msg) {
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

  exceptionToast(String msg) {
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

  void searchOrgName(String orgName) {
    //it is the search bar to search the organization
    _filteredOrgInfo.clear();
    if (orgName.isNotEmpty) {
      for (int i = 0; i < organizationInfo.length; i++) {
        final String name = organizationInfo[i]['name'].toString();
        if (name.toLowerCase().contains(orgName.toLowerCase())) {
          _filteredOrgInfo.add(organizationInfo[i]);
          notifyListeners();
        }
      }
    } else {
      _filteredOrgInfo.add(organizationInfo);
      notifyListeners();
    }
  }

  // Function for getting the current user id.
  Future<void> getCurrentUserId() async {
    _currentUserId = await _pref.getUserId();
    notifyListeners();
  }

  Future fetchOrg() async {
    getCurrentUserId();
    //function to fetch the org from the server
    final GraphQLClient _client = graphQLConfiguration.authClient();

    final QueryResult result = await _client
        .query(QueryOptions(documentNode: gql(_query.fetchOrganizations)));

    // Get the details of the current user.
    final QueryResult userDetailsResult = await _client.query(QueryOptions(
        documentNode: gql(_query.fetchUserInfo),
        variables: {'id': _currentUserId}));

    if (result.hasException || userDetailsResult.hasException) {
      print(result.exception);
      showError(result.exception.toString());
    } else if (!result.hasException &&
        !disposed &&
        !userDetailsResult.hasException) {
      _organizationInfo = result.data['organizations'] as List;
      _organizationInfo = result.data['organizations'] as List;

      // Get the details of joined organizations.
      joinedOrganizations =
          userDetailsResult.data['users'][0]['joinedOrganizations'] as List;

      // Get the id's of joined organizations.
      joinedOrganizations.forEach((element) {
        joinedOrganizationsIds.add(element['_id']);
      });

      // Filtering out organizations that are created by current user.
      _organizationInfo = organizationInfo
          .where((element) => element['admins'][0]['_id'] != _currentUserId)
          .toList();

      // Filtering out organizations that are already joined by user.
      joinedOrganizationsIds.forEach((e) {
        print(e);
        _organizationInfo =
            organizationInfo.where((element) => element['_id'] != e).toList();
      });
      notifyListeners();
    }
  }

  Future joinPrivateOrg(BuildContext context) async {
    //function called if the person wants to enter a private organization
    final GraphQLClient _client = graphQLConfiguration.authClient();

    final QueryResult result = await _client.mutate(MutationOptions(
        documentNode: gql(_query.sendMembershipRequest(_itemIndex))));

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      print("getting new token");
      _authController.getNewToken();
      return joinPrivateOrg(context);
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      exceptionToast(result.exception.toString().substring(16));
    } else if (!result.hasException && !result.loading) {
      successToast("Request Sent to Organization Admin");
      Navigator.pop(context);
    }
  }

  Future joinPublicOrg(BuildContext context, String orgName) async {
    //function which will be called if the person wants to join the organization which is not private
    final GraphQLClient _client = graphQLConfiguration.authClient();

    print(orgName);

    final QueryResult result = await _client
        .mutate(MutationOptions(documentNode: gql(_query.getOrgId(itemIndex))));

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      exceptionToast(result.exception.toString().substring(16));
      return joinPublicOrg(context, orgName);
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      exceptionToast(result.exception.toString().substring(16));
    } else if (!result.hasException && !result.loading) {
      joinedOrg =
          result.data['joinPublicOrganization']['joinedOrganizations'] as List;

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
      successToast("Success!");
      Navigator.pop(context);

      // pushNewScreen(
      //   context,
      //   screen: const ProfilePage(),
      // );
      //Navigate user to newsfeed
      // if (widget.fromProfile) {
      //   pushNewScreen(
      //     context,
      //     screen: const ProfilePage(),
      //   );
      // } else {
      //   Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(
      //       builder: (context) => const HomePage(
      //         openPageIndex: 4,
      //       ),
      //     ),
      //   );
      // }
    }
  }
}
