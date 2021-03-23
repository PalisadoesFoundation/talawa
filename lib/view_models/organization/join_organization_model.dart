import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/view_models/base_model.dart';

import '../../locator.dart';

class JoinOrgnizationViewModel extends BaseModel {
  Queries _query = Queries();
  Preferences _pref = Preferences();
  String token;
  String _itemIndex;
  GraphQLConfiguration graphQLConfiguration = locator<GraphQLConfiguration>();
  FToast fToast;
  List _organizationInfo = List();
  List _filteredOrgInfo = List();
  List joinedOrg = [];
  AuthController _authController = AuthController();
  String _isPublic;
  String _fetchingOrgError = "";
  bool _hasFetchingOrgError = false;
  String _sendingRequestToOrgError = "";

  bool disposed = false;

  String get fetchingOrgError => _fetchingOrgError;
  bool get hasFetchingOrgError => _hasFetchingOrgError;
  String get sendingRequestToOrgError => _sendingRequestToOrgError;

  List get organizationInfo => _organizationInfo;
  List get filteredOrgInfo => _filteredOrgInfo;

  String get isPublic => _isPublic;
  String get itemIndex => _itemIndex;

  void initialise(BuildContext context) {
    fToast = FToast();
    fToast.init(context);
    fetchOrg();
  }

  void setIsPublic(String str) {
    _isPublic = str;
    notifyListeners();
  }

  void setItemIndex(String str) {
    _itemIndex = str;
    notifyListeners();
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

  successToast(String msg) {
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

  exceptionToast(String msg) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            msg,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }

  void searchOrgName(String orgName) {
    //it is the search bar to search the organization
    _filteredOrgInfo.clear();
    if (orgName.isNotEmpty) {
      for (int i = 0; i < organizationInfo.length; i++) {
        String name = organizationInfo[i]['name'];
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

  Future fetchOrg() async {
    //function to fetch the org from the server
    GraphQLClient _client = graphQLConfiguration.authClient();

    QueryResult result = await _client
        .query(QueryOptions(documentNode: gql(_query.fetchOrganizations)));
    if (result.hasException) {
      showError(result.exception.toString());
    } else if (!result.hasException && !disposed) {
      _organizationInfo = result.data['organizations'];
      notifyListeners();
    }
  }

  Future joinPrivateOrg(BuildContext context) async {
    //function called if the person wants to enter a private organization
    GraphQLClient _client = graphQLConfiguration.authClient();

    QueryResult result = await _client.mutate(MutationOptions(
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

  Future joinPublicOrg(BuildContext context) async {
    //function which will be called if the person wants to join the organization which is not private
    GraphQLClient _client = graphQLConfiguration.authClient();

    QueryResult result = await _client.mutate(
        MutationOptions(documentNode: gql(_query.getOrgId(_itemIndex))));

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      print("getting new token");

      return joinPublicOrg(context);
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      exceptionToast(result.exception.toString().substring(16));

      notifyListeners();
    } else if (!result.hasException && !result.loading) {
      joinedOrg = result.data['joinPublicOrganization']['joinedOrganizations'];
      notifyListeners();
      //set the default organization to the first one in the list
      if (joinedOrg.length == 1) {
        final String currentOrgId = result.data['joinPublicOrganization']
            ['joinedOrganizations'][0]['_id'];
        await _pref.saveCurrentOrgId(currentOrgId);
        final String currentOrgImgSrc = result.data['joinPublicOrganization']
            ['joinedOrganizations'][0]['image'];
        await _pref.saveCurrentOrgImgSrc(currentOrgImgSrc);
        final String currentOrgName = result.data['joinPublicOrganization']
            ['joinedOrganizations'][0]['name'];
        await _pref.saveCurrentOrgName(currentOrgName);
      }
      successToast("Sucess!");
      print("Success");
      Navigator.pop(context);
    }
    return false;
  }
}
