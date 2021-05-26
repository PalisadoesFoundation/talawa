//flutter packages are called here
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/controllers/auth_controller.dart';

//pages are called here
import 'package:talawa/services/preferences.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/views/pages/home_page.dart';
import 'package:talawa/views/pages/organization/profile_page.dart';

class OrgController with ChangeNotifier {
  String currentUserId;
  List joinedOrganizations = [];
  List joinedOrganizationsIds = [];
  List organizationInfo;
  List filteredOrgInfo = [];
  List joinedOrg = [];

  final Queries _query = Queries();
  final Preferences _pref = Preferences();
  final AuthController _authController = AuthController();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  List get getOrganizationList {
    return organizationInfo;
  }

  int get getTotalOrg {
    return organizationInfo.length;
  }

  Future<void> setNewOrg(
      BuildContext context, String newOrgId, String newOrgName) async {
    await Preferences.removeOrg();
    await _pref.saveCurrentOrgId(newOrgId);
    await _pref.saveCurrentOrgName(newOrgName);
  }

  /// FUNCTION FOR GETTING [CURRENT USER ID]
  Future<void> getCurrentUserId() async {
    currentUserId = await _pref.getUserId();
  }

  /// SEARCH BAR TO [SEARCH] THE [ORGANIZATION]
  void searchOrgName(String orgName) {
    filteredOrgInfo.clear();
    if (orgName.isNotEmpty) {
      for (int i = 0; i < organizationInfo.length; i++) {
        final String name = organizationInfo[i]['name'].toString();
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

  /// FETCH THE [LIST] OF ALL THE [ORGANIZATIONS]
  Future fetchOrg({@required bool disposed}) async {
    getCurrentUserId();

    final GraphQLClient _client = graphQLConfiguration.authClient();
    final QueryResult result = await _client.query(
      QueryOptions(documentNode: gql(_query.getOrganizationsConnection)),
    );

    /// GET THE DETAILS OF THE CURRENT USER
    final QueryResult userDetailsResult = await _client.query(
      QueryOptions(
        documentNode: gql(_query.fetchUserInfo),
        variables: {'id': currentUserId},
      ),
    );

    if (result.hasException || userDetailsResult.hasException) {
      debugPrint(result.exception.toString());
      showError(result.exception.toString());
    } else if (!result.hasException &&
        !disposed &&
        !userDetailsResult.hasException) {
      organizationInfo = result.data['organizationsConnection'] as List;

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
        debugPrint(e.toString());
        organizationInfo =
            organizationInfo.where((element) => element['_id'] != e).toList();
      });
      notifyListeners();
    }
  }

  /// FUNCTION CALLED TP JOIN THE PRIVATE ORGANIZATION
  Future joinPrivateOrg(BuildContext context, String itemIndex,
      {@required bool fromProfile}) async {
    final GraphQLClient _client = graphQLConfiguration.authClient();

    final QueryResult result = await _client.mutate(MutationOptions(
        documentNode: gql(_query.sendMembershipRequest(itemIndex))));

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return joinPrivateOrg(context, itemIndex, fromProfile: fromProfile);
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      CustomToast.exceptionToast(
        msg: result.exception.toString().substring(16),
      );
    } else if (!result.hasException && !result.loading) {
      CustomToast.sucessToast(msg: "Request Sent to Organization Admin");

      if (fromProfile) {
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

  /// Function which will be called if the person wants to join the public organization
  Future<void> joinPublicOrg(
      String orgName, String itemIndex, BuildContext context,
      {bool fromProfile}) async {
    final GraphQLClient _client = graphQLConfiguration.authClient();
    debugPrint(orgName);

    final QueryResult result = await _client.mutate(
      MutationOptions(
        documentNode: gql(
          _query.getOrgId(
            itemIndex,
          ),
        ),
      ),
    );

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      CustomToast.exceptionToast(
          msg: result.exception.toString().substring(16));
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      CustomToast.exceptionToast(
          msg: result.exception.toString().substring(16));
    } else if (!result.hasException && !result.loading) {
      joinedOrg =
          result.data['joinPublicOrganization']['joinedOrganizations'] as List;
      notifyListeners();

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
      CustomToast.sucessToast(msg: "Success!");

      if (fromProfile) {
        pushNewScreen(
          context,
          screen: const ProfilePage(),
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

  Widget showError(String msg) {
    return Center(
      child: Text(
        msg,
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}
