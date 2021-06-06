import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/enums/exception_type.dart';
import 'package:talawa/enums/viewstate.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/services/exception.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/view_models/base_model.dart';
import 'package:talawa/views/pages/organization/profile_page.dart';

class ProfilePageViewModel extends BaseModel {
  BuildContext _context;
  final Queries _query = Queries();
  final Preferences _preferences = Preferences();
  final AuthController _authController = AuthController();
  List<User> _userDetails = [];
  List _orgAdmin = [], _org = [], _admins = [], _curOrganization = [];
  bool _isCreator;
  bool _isPublic;
  String _creator;
  String _userID;
  String _orgName;
  final OrgController _orgController = OrgController();
  String _orgId;
  GraphQLConfiguration _graphQLConfiguration = GraphQLConfiguration();

  List<User> get userDetails => _userDetails;
  List get curOrganization => _curOrganization;
  String get orgName => _orgName;
  List get org => _org;
  String get userID => _userID;
  String get creator => _creator;
  bool get isPublic => _isPublic;
  bool get isCreator => _isCreator;
  AuthController get authController => _authController;

  initialize({@required BuildContext context}) {
    _context = context;
    fetchUserDetails(context);
  }

  //used to fetch the users details from the server
  Future fetchUserDetails(BuildContext context) async {
    setState(ViewState.busy);
    _orgName = await _preferences.getCurrentOrgName();
    _orgId = await _preferences.getCurrentOrgId();
    _userID = await _preferences.getUserId();
    final GraphQLClient _client = _graphQLConfiguration.clientToQuery();
    final QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.fetchUserInfo), variables: {'id': _userID}));
    if (result.hasException) {
      print(result.exception);
      CustomToast.exceptionToast(
        msg: AppLocalizations.of(context).translate(
          "Something went wrong!Try again later",
        ),
      );
    } else if (!result.hasException) {
      print(result);
      _userDetails = userFromJson(json.encode(result.data['users']));
      print("user details");
      print(_userDetails);
      _org = _userDetails[0].joinedOrganizations;
      notifyListeners();
      int notFound = 0;
      for (int i = 0; i < _org.length; i++) {
        if (_org[i].id == _orgId) {
          break;
        } else {
          notFound++;
        }
      }
      if (notFound == _org.length && _org.isNotEmpty) {
        _orgController.setNewOrg(
            _context, _org[0]['_id'].toString(), _org[0]['name'].toString());
        Provider.of<Preferences>(_context, listen: false)
            .saveCurrentOrgName(_org[0]['name'].toString());
        Provider.of<Preferences>(_context, listen: false)
            .saveCurrentOrgId(_org[0]['_id'].toString());
        await _preferences.saveCurrentOrgImgSrc(_org[0]['image'].toString());
      }
      fetchOrgAdmin(context);
    }
    setState(ViewState.idle);
  }

  //used to fetch Organization Admin details
  Future fetchOrgAdmin(BuildContext context) async {
    _orgName = await _preferences.getCurrentOrgName();
    _orgId = await _preferences.getCurrentOrgId();
    if (_orgId != null) {
      final GraphQLClient _client = _graphQLConfiguration.authClient();
      final QueryResult result = await _client
          .query(QueryOptions(documentNode: gql(_query.fetchOrgById(_orgId))));
      if (result.hasException) {
        print(result.exception.toString());
        CustomToast.exceptionToast(
          msg:
              AppLocalizations.of(context).translate("Please Try Again later!"),
        );
      } else if (!result.hasException) {
        print('here');
        _curOrganization = result.data['organizations'] as List;
        _creator = result.data['organizations'][0]['creator']['_id'].toString();
        _isPublic = result.data['organizations'][0]['isPublic'] as bool;
        result.data['organizations'][0]['admins']
            .forEach((userId) => _admins.add(userId));
        for (int i = 0; i < _admins.length; i++) {
          print(_admins[i]['_id']);
          if (_admins[i]['_id'] == _userID) {
            _isCreator = true;
            break;
          } else {
            _isCreator = false;
          }
        }
      }
    } else {
      _isCreator = false;
    }
    notifyListeners();
  }

  //function used when someone wants to leave organization
  Future leaveOrg(BuildContext context) async {
    List remaindingOrg = [];
    String newOrgId;
    String newOrgName;
    final String orgId = await _preferences.getCurrentOrgId();

    final GraphQLClient _client = _graphQLConfiguration.authClient();

    final QueryResult result = await _client
        .mutate(MutationOptions(documentNode: gql(_query.leaveOrg(orgId))));

    if (result.hasException) {
      final ExceptionType exceptionType = retrieveExceptionType(result);
      if (exceptionType == ExceptionType.accesstokenException) {
        _authController.getNewToken();
        print('loop');
        return leaveOrg(context);
      } else {
        print('exception: ${result.exception.toString()}');
        CustomToast.exceptionToast(
          msg: AppLocalizations.of(context).translate(
            "Please Try Again later!",
          ),
        );
      }
      return;
    }
    if (!result.loading) {
      print('done');
      remaindingOrg =
          result.data['leaveOrganization']['joinedOrganizations'] as List;
      if (remaindingOrg.isEmpty) {
        newOrgId = null;
      } else if (remaindingOrg.isNotEmpty) {
        newOrgId = result.data['leaveOrganization']['joinedOrganizations'][0]
                ['_id']
            .toString();
        newOrgName = result.data['leaveOrganization']['joinedOrganizations'][0]
                ['name']
            .toString();
      }

      _orgController.setNewOrg(_context, newOrgId, newOrgName);
      Provider.of<Preferences>(_context, listen: false)
          .saveCurrentOrgName(newOrgName);
      Provider.of<Preferences>(_context, listen: false)
          .saveCurrentOrgId(newOrgId);
      //  _successToast('You are no longer apart of this organization');
      pushNewScreen(
        _context,
        screen: const ProfilePage(),
      );
    }
  }
}
