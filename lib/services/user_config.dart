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
  late User? _currentUser = User(id: 'null', authToken: 'null');
  late OrgInfo? _currentOrg = OrgInfo(name: 'Organization Name', id: 'null');
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

    // if there is not currentUser then returns false.
    if (_currentUser == null) {
      _currentUser = User(id: 'null', authToken: 'null');
      return false;
    }
    // generate access token
    graphqlConfig.getToken().then((value) async {
      try {
        databaseFunctions.init();
        await sessionManager.refreshSession();
        databaseFunctions.init();
        final QueryResult result = await databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo,
          variables: {'id': currentUser.id},
        );
        final List users = result.data!['users'] as List;
        final User userInfo = User.fromJson(
          users[0] as Map<String, dynamic>,
          fromOrg: false,
        );
        userInfo.authToken = userConfig.currentUser.authToken;
        userInfo.refreshToken = userConfig.currentUser.refreshToken;
        userConfig.updateUser(userInfo);
        _currentOrg ??= _currentUser!.joinedOrganizations![0];
        _currentOrgInfoController.add(_currentOrg!);
        saveUserInHive();
        return true;
      } on Exception catch (e) {
        print(e);
        navigationService.showTalawaErrorSnackBar(
          "Couldn't update User details",
          MessageType.error,
        );
      }
    });
    return true;
  }

  /// Logs out the current user.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<bool>`: returns future of bool type.
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
        return await databaseFunctions.gqlAuthMutation(queries.logout());
      },
      onValidResult: (result) async {
        if (result.data != null && result.data!['logout'] == true) {
          // throw StateError('error');

          final user = Hive.box<User>('currentUser');
          final url = Hive.box('url');
          final organisation = Hive.box<OrgInfo>('currentOrg');
          // final androidFirebaseOptionsBox = Hive.box('androidFirebaseOptions');
          // final iosFirebaseOptionsBox = Hive.box('iosFirebaseOptions');
          await user.clear();
          await url.clear();
          await organisation.clear();
          // androidFirebaseOptionsBox.clear();
          // iosFirebaseOptionsBox.clear();
          // try {
          //   Firebase.app()
          //       .delete(); // Deleting app will stop all Firebase plugins
          // } catch (e) {
          //   debugPrint("ERROR: Unable to delete firebase app $e");
          // }
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

  /// Updates the user joined organization.
  ///
  /// **params**:
  /// * `orgDetails`: details of the organization that user joined.
  ///
  /// **returns**:
  /// * `Future<void>`: returns future of void type.
  Future<void> updateUserJoinedOrg(List<OrgInfo> orgDetails) async {
    _currentUser!.updateJoinedOrg(orgDetails);
    saveUserInHive();
  }

  /// Updates the user created organization.
  ///
  /// **params**:
  /// * `orgDetails`: details of the organization that user joined.
  ///
  /// **returns**:
  /// * `Future<void>`: returns future of void type.
  Future<void> updateUserCreatedOrg(List<OrgInfo> orgDetails) async {
    _currentUser!.updateCreatedOrg(orgDetails);
    saveUserInHive();
  }

  /// Updates the user request to join the organization.
  ///
  /// **params**:
  /// * `orgDetails`: details of the organization that user joined.
  ///
  /// **returns**:
  /// * `Future<void>`: returns future of void type.
  Future<void> updateUserMemberRequestOrg(List<OrgInfo> orgDetails) async {
    _currentUser!.updateMemberRequestOrg(orgDetails);
    saveUserInHive();
  }

  /// Updates the organization admin.
  ///
  /// **params**:
  /// * `orgDetails`: details of the organization that user joined.
  ///
  /// **returns**:
  /// * `Future<void>`: returns future of void type.
  Future<void> updateUserAdminOrg(List<OrgInfo> orgDetails) async {
    _currentUser!.updateAdminFor(orgDetails);
    saveUserInHive();
  }

  /// Updates the access token of the user.
  ///
  /// **params**:
  /// * `accessToken`: current user's accesstoken.
  /// * `refreshToken`: current user's refreshtoken.
  ///
  /// **returns**:
  /// * `Future<void>`: returns future of void type.
  Future<void> updateAccessToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    _currentUser!.refreshToken = refreshToken;
    _currentUser!.authToken = accessToken;
    saveUserInHive();
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
      saveUserInHive();
      graphqlConfig.getToken();
      databaseFunctions.init();
      return true;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  /// save user in hive.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void saveUserInHive() {
    final box = Hive.box<User>('currentUser');
    if (box.get('user') == null) {
      box.put('user', _currentUser!);
    } else {
      box.put('user', _currentUser!);
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
