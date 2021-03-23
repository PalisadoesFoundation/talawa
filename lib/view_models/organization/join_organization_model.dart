import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/view_models/base_model.dart';

import '../../locator.dart';

class JoinOrgnizationModel extends BaseModel {
  Queries _query = Queries();
  Preferences _pref = Preferences();
  String token;
  static String itemIndex;
  GraphQLConfiguration graphQLConfiguration = locator<GraphQLConfiguration>();
  FToast fToast;
  List _organizationInfo = List();
  List filteredOrgInfo = List();
  List joinedOrg = [];
  AuthController _authController = AuthController();
  String isPublic;
  String _fetchingOrgError = "";
  bool _hasFetchingOrgError = false;
  String _sendingRequestToOrgError = "";

  bool disposed = false;

  String get fetchingOrgError => _fetchingOrgError;
  bool get hasFetchingOrgError => _hasFetchingOrgError;
  String get sendingRequestToOrgError => _sendingRequestToOrgError;

  List get organizationInfo => _organizationInfo;

  void initialise() {
    fetchOrg();
  }

  void searchOrgName(String orgName) {
    //it is the search bar to search the organization
    filteredOrgInfo.clear();
    if (orgName.isNotEmpty) {
      for (int i = 0; i < organizationInfo.length; i++) {
        String name = organizationInfo[i]['name'];
        if (name.toLowerCase().contains(orgName.toLowerCase())) {
          filteredOrgInfo.add(organizationInfo[i]);
          notifyListeners();
        }
      }
    } else {
      filteredOrgInfo.add(organizationInfo);
      notifyListeners();
    }
  }

  Future fetchOrg() async {
    //function to fetch the org from the server
    GraphQLClient _client = graphQLConfiguration.authClient();

    QueryResult result = await _client
        .query(QueryOptions(documentNode: gql(_query.fetchOrganizations)));
    if (result.hasException) {
      _hasFetchingOrgError = true;
      _fetchingOrgError = result.exception.toString();
      notifyListeners();
    } else if (!result.hasException && !disposed) {
      _organizationInfo = result.data['organizations'];
      notifyListeners();
    }
  }

  Future<bool> joinPrivateOrg() async {
    //function called if the person wants to enter a private organization
    GraphQLClient _client = graphQLConfiguration.authClient();

    QueryResult result = await _client.mutate(MutationOptions(
        documentNode: gql(_query.sendMembershipRequest(itemIndex))));

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return joinPrivateOrg();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      _sendingRequestToOrgError = result.exception.toString().substring(16);
      notifyListeners();
      return false;
    } else if (!result.hasException && !result.loading) {
      return true;
    }
    return false;
  }

  Future<bool> joinPublicOrg() async {
    //function which will be called if the person wants to join the organization which is not private
    GraphQLClient _client = graphQLConfiguration.authClient();

    QueryResult result = await _client
        .mutate(MutationOptions(documentNode: gql(_query.getOrgId(itemIndex))));

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return joinPublicOrg();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      _sendingRequestToOrgError = result.exception.toString().substring(16);
      notifyListeners();
      return false;
    } else if (!result.hasException && !result.loading) {
      joinedOrg = result.data['joinPublicOrganization']['joinedOrganizations'];

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
      return true;
    }
    return false;
  }
}
