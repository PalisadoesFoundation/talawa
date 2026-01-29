import 'dart:async';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:talawa/constants/app_strings.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';
import 'package:talawa/widgets/talawa_error_dialog.dart';

/// Provides different services in the context of the User.
///
/// Services include:
/// * `userLoggedIn` : helps to make user logged in to the application.
/// * `updateUserJoinedOrg` : helps to update the user joined organization.
/// * `updateUserCreatedOrg` : helps to update the user created organization.
/// * `updateUserMemberRequestOrg` : helps to update the User membership
/// request for the organization.
/// * `updateUserAdminOrg` : helps to update the Admin of the Organization.
/// * `updateAccessToken` : helps to update the access token of an user.
/// * `updateUser` : helps to update the user.
class UserConfig {
  // variables
  User? _currentUser = User(id: 'null', authToken: 'null');
  OrgInfo? _currentOrg = OrgInfo(name: 'Organization Name', id: 'null');
  late Stream<OrgInfo> _currentOrgInfoStream;
  final StreamController<OrgInfo> _currentOrgInfoController =
      StreamController<OrgInfo>.broadcast();

  /// Retrieves the stream of current organization information.
  Stream<OrgInfo> get currentOrgInfoStream => _currentOrgInfoStream;

  /// Retrieves the stream controller for current organization information.
  StreamController<OrgInfo> get currentOrgInfoController =>
      _currentOrgInfoController;

  /// Retrieves the current organization information.
  OrgInfo get currentOrg => _currentOrg!;

  /// Retrieves the name of the current organization.
  String get currentOrgName => _currentOrg!.name!;

  /// Checks if a user is logged in.
  bool get loggedIn => _currentUser?.id != 'null';

  /// Updates the current organization information.
  set currentOrg(OrgInfo org) => _currentOrg = org;

  /// Retrieves the current user.
  User get currentUser => _currentUser!;

  /// Updates the current user.
  set currentUser(User user) {
    _currentUser = user;
  }

  /// initialise.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initialiseStream() {
    _currentOrgInfoStream =
        _currentOrgInfoController.stream.asBroadcastStream();
  }

  /// This function is used to log in the user.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<bool>`: returns future of bool type.
  Future<bool> userLoggedIn() async {
    initialiseStream();
    final boxUser = Hive.box<User>('currentUser');
    final boxOrg = Hive.box<OrgInfo>('currentOrg');
    _currentOrg =
        boxOrg.get('org') ?? OrgInfo(name: 'Organization Name', id: 'null');
    _currentOrgInfoController.add(_currentOrg!);

    _currentUser = boxUser.get('user');

    final String? secureAuthToken = await secureStorage.readToken('authToken');
    final String? secureRefreshToken =
        await secureStorage.readToken('refreshToken');

    if (secureAuthToken == null && _currentUser?.authToken != null) {
      await secureStorage.writeToken('authToken', _currentUser!.authToken!);
      if (_currentUser!.refreshToken != null) {
        await secureStorage.writeToken(
            'refreshToken', _currentUser!.refreshToken!);
      }

      // Capture tokens to be restored
      final tempAuth = _currentUser!.authToken;
      final tempRefresh = _currentUser!.refreshToken;

      // Sanitise local user object to remove legacy tokens
      _currentUser?.authToken = null;
      _currentUser?.refreshToken = null;

      // Update Hive to remove unencrypted tokens
      await saveUserInHive();

      // Restore tokens for the session
      _currentUser?.authToken = tempAuth;
      _currentUser?.refreshToken = tempRefresh;
    } else {
      if (secureAuthToken != null) {
        _currentUser?.authToken = secureAuthToken;
      }
      if (secureRefreshToken != null) {
        _currentUser?.refreshToken = secureRefreshToken;
      }
    }

    // if there is not currentUser then returns false.
    if (_currentUser == null || _currentUser?.authToken == null) {
      _currentUser = User(id: 'null', authToken: 'null');
      return false;
    }
    // generate access token
    graphqlConfig.getToken();

    try {
      databaseFunctions.init();

      final QueryResult result = await databaseFunctions.gqlAuthQuery(
        queries.fetchUserInfo(),
        variables: {'id': currentUser.id},
      );
      if (result.hasException ||
          result.data == null ||
          result.data!['user'] == null) {
        throw Exception('Unable to fetch user details');
      }
      final user = result.data!['user'] as Map<String, dynamic>;
      final User userInfo = User.fromJson(
        user,
      );
      userInfo.authToken = userConfig.currentUser.authToken;
      userInfo.refreshToken = userConfig.currentUser.refreshToken;
      userConfig.updateUser(userInfo);
      _currentOrg ??= _currentUser?.joinedOrganizations![0];
      if (_currentOrg == null ||
          _currentOrg?.id == null ||
          _currentOrg?.id == 'null') {
        final joined = _currentUser?.joinedOrganizations;
        if (joined != null && joined.isNotEmpty) {
          _currentOrg = joined.first;
          userConfig.updateUserJoinedOrg(_currentOrg!);
        }
      }

      return true;
    } on Exception catch (e) {
      print(e);
      navigationService.showTalawaErrorSnackBar(
        "Couldn't update User details",
        MessageType.error,
      );
      return false;
    }
  }

  /// Logs out the current user.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None

  Future<void> userLogOut() async {
    await actionHandlerService.performAction(
      actionType: ActionType.critical,
      criticalActionFailureMessage: TalawaErrors.youAreOfflineUnableToLogout,
      action: () async {
        navigationService.pop();
        navigationService.pushDialog(
          const CustomProgressDialog(
            key: Key('LogoutProgress'),
          ),
        );
        //return await databaseFunctions.gqlAuthMutation(queries.logout());
        return await performLogout();
      },
      onValidResult: (result) async {
        // The result could contain either our server response or the fallback response
        // In either case, we should clear local data
        if (result.data != null && result.data!['logout'] == true) {
          final user = Hive.box<User>('currentUser');
          final url = Hive.box('url');
          final organisation = Hive.box<OrgInfo>('currentOrg');
          await user.clear();
          await url.clear();
          await organisation.clear();
          await secureStorage.deleteAll();
          _currentUser = User(id: 'null', authToken: 'null');
        }
      },
      onActionException: (e) async {
        navigationService.pushDialog(
          const TalawaErrorDialog(
            'Unable to logout, please try again.',
            key: Key('TalawaError'),
            messageType: MessageType.error,
          ),
        );
      },
      updateUI: () {
        navigationService.pop();
      },
      apiCallSuccessUpdateUI: () {
        navigationService.removeAllAndPush(
          Routes.setUrlScreen,
          Routes.splashScreen,
          arguments: '',
        );
      },
    );
  }

  /// Performs client-side logout
  ///
  /// Note : implement server side token invalidation when logOut mutation is updated in API.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<QueryResult>`: returns future of QueryResult type.
  Future<QueryResult> performLogout() async {
    return QueryResult(
      data: {'logout': true},
      source: QueryResultSource.network,
      options: QueryOptions(document: gql('{ __typename }')),
    );
  }

  /// Updates the user joined organization.
  ///
  /// **params**:
  /// * `orgDetails`: details of the organization that user joined.
  ///
  /// **returns**:
  ///   None
  Future<void> updateUserJoinedOrg(OrgInfo orgDetails) async {
    if (orgDetails.id == null || orgDetails.id!.isEmpty) {
      return;
    }
    _currentUser?.updateJoinedOrg(orgDetails);

    _currentOrg = orgDetails;
    saveCurrentOrgInHive(orgDetails);
    await saveUserInHive();
  }

  /// Updates the user request to join the organization.
  ///
  /// **params**:
  /// * `orgDetails`: details of the organization that user joined.
  ///
  /// **returns**:
  ///   None
  Future<void> updateUserMemberRequestOrg(List<String> orgDetails) async {
    _currentUser?.updateMemberRequestOrg(orgDetails);
    await saveUserInHive();
  }

  /// Updates the access token of the user.
  ///
  /// **params**:
  /// * `accessToken`: current user's accesstoken.
  /// * `refreshToken`: current user's refreshtoken.
  ///
  /// **returns**:
  ///   None
  Future<void> updateAccessToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    if (accessToken.isNotEmpty) {
      _currentUser?.authToken = accessToken;
      await secureStorage.writeToken('authToken', accessToken);
    } else {
      _currentUser?.authToken = null;
      await secureStorage.deleteToken('authToken');
    }

    if (refreshToken.isNotEmpty) {
      _currentUser?.refreshToken = refreshToken;
      await secureStorage.writeToken('refreshToken', refreshToken);
    } else {
      _currentUser?.refreshToken = null;
      await secureStorage.deleteToken('refreshToken');
    }

    await saveUserInHive();
  }

  /// Updates the user details.
  ///
  /// **params**:
  /// * `updatedUserDetails`: `User` type variable containing
  ///  all the details of an user need to be updated.
  ///
  /// **returns**:
  /// * `Future<bool>`: returns future of bool type.
  Future<bool> updateUser(User updatedUserDetails) async {
    try {
      _currentUser = updatedUserDetails;
      await saveUserInHive();
      graphqlConfig.getToken();
      databaseFunctions.init();
      return true;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  /// Executes an API call with error handling to exit current joined organization.
  ///
  /// **params**:
  ///   None
  ///   of type `T`.
  ///
  /// **returns**:
  ///   None
  Future<void> exitCurrentOrg() async {
    if (_currentOrg == null ||
        _currentOrg?.id == null ||
        _currentOrg?.id == "null") {
      return;
    }
    if (_currentUser == null ||
        _currentUser?.joinedOrganizations == null ||
        _currentUser!.joinedOrganizations!.isEmpty) {
      return;
    }

    try {
      final result = await databaseFunctions.gqlAuthMutation(
        Queries().deleteOrganizationMembershipMutation(),
        variables: {
          'organizationId': _currentOrg!.id,
          'memberId': _currentUser!.id,
        },
      );

      if (result.data == null || result.hasException) {
        throw Exception('Unable to exit organization, please try again.');
      }

      final orgMembership =
          result.data!['deleteOrganizationMembership'] as Map<String, dynamic>?;
      if (orgMembership == null || orgMembership['id'] == null) {
        throw Exception('Unable to exit organization, please try again.');
      }

      _currentUser?.joinedOrganizations!
          .removeWhere((org) => org.id == _currentOrg!.id);
      navigationService.showSnackBar(
        'Exited ${_currentOrg?.name} successfully',
        duration: const Duration(seconds: 2),
      );
      if (_currentUser?.joinedOrganizations?.isNotEmpty == true) {
        _currentOrg = _currentUser?.joinedOrganizations?.first;
      } else {
        _currentOrg = null;
        if (userConfig.currentUser.membershipRequests != null &&
            userConfig.currentUser.membershipRequests!.isNotEmpty) {
          navigationService.removeAllAndPush(
            Routes.waitingScreen,
            Routes.mainScreen,
            arguments: '0',
          );
        } else {
          navigationService.removeAllAndPush(
            Routes.joinOrg,
            Routes.mainScreen,
            arguments: '-1',
          );
        }
      }

      if (_currentOrg != null) {
        saveCurrentOrgInHive(_currentOrg!);
      }

      await saveUserInHive();
    } catch (e) {
      debugPrint(e.toString());
      navigationService.showTalawaErrorSnackBar(
        'Unable to exit organization, please try again.',
        MessageType.error,
      );
    }
  }

  /// save user in hive.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> saveUserInHive() async {
    final box = Hive.box<User>('currentUser');

    // Create a sanitized copy of the user without tokens
    if (_currentUser != null) {
      final sanitizedUser = User(
        id: _currentUser!.id,
        name: _currentUser!.name,
        email: _currentUser!.email,
        image: _currentUser!.image,
        joinedOrganizations: _currentUser!.joinedOrganizations,
        membershipRequests: _currentUser!.membershipRequests,
        authToken: null, // Do not persist in Hive
        refreshToken: null, // Do not persist in Hive
      );

      await box.put('user', sanitizedUser);
    }

    // Persist tokens securely
    if (_currentUser?.authToken != null) {
      await secureStorage.writeToken('authToken', _currentUser!.authToken!);
    }
    if (_currentUser?.refreshToken != null &&
        _currentUser!.refreshToken!.isNotEmpty) {
      await secureStorage.writeToken(
          'refreshToken', _currentUser!.refreshToken!);
    }
  }

  /// save current organization details in hive.
  ///
  /// **params**:
  /// * `saveOrgAsCurrent`: instance of OrgInfo
  ///
  /// **returns**:
  ///   None
  void saveCurrentOrgInHive(OrgInfo saveOrgAsCurrent) {
    _currentOrg = saveOrgAsCurrent;
    _currentOrgInfoController.add(_currentOrg!);
    final box = Hive.box<OrgInfo>('currentOrg');
    if (box.get('org') == null) {
      box.put('org', _currentOrg!);
    } else {
      box.put('org', _currentOrg!);
    }
  }
}
