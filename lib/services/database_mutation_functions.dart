import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/widgets/progress_dialog.dart';

class DataBaseMutationFunctions {
  late GraphQLClient clientNonAuth;
  late GraphQLClient clientAuth;
  late NavigationService navigatorService;
  late UserConfig userConfig;
  late Queries _query;

  init() {
    clientNonAuth = locator<GraphqlConfig>().clientToQuery();
    clientAuth = locator<GraphqlConfig>().authClient();
    navigatorService = locator<NavigationService>();
    userConfig = locator<UserConfig>();
    _query = Queries();
  }

  GraphQLError userNotFound = const GraphQLError(message: 'User not found');
  GraphQLError userNotAuthenticated = const GraphQLError(
      message: 'User is not authenticated: Undefined location');
  GraphQLError emailAccountPresent =
      const GraphQLError(message: 'Email address already exists');
  GraphQLError wrongCredentials =
      const GraphQLError(message: 'Invalid credentials');
  GraphQLError organizationNotFound =
      const GraphQLError(message: 'Organization not found');
  GraphQLError refreshAccessTokenExpiredException = const GraphQLError(
      message:
          'Access Token has expired. Please refresh session.: Undefined location');

  bool? encounteredExceptionOrError(OperationException exception,
      {bool showSnackBar = true}) {
    if (exception.linkException != null) {
      print(exception.linkException);
      if (showSnackBar) {
        navigatorService.showSnackBar("Server not running/wrong url");
      }
      return false;
    } else {
      print(exception.graphqlErrors);
      for (int i = 0; i < exception.graphqlErrors.length; i++) {
        if (exception.graphqlErrors[i].message ==
            refreshAccessTokenExpiredException.message) {
          return true;
        } else if (exception.graphqlErrors[i].message == userNotFound.message) {
          if (showSnackBar) {
            navigatorService
                .showSnackBar("No account registered with this email");
          }
          return false;
        } else if (exception.graphqlErrors[i].message ==
            wrongCredentials.message) {
          if (showSnackBar) {
            navigatorService.showSnackBar("Enter a valid password");
          }
          return false;
        } else if (exception.graphqlErrors[i].message ==
            organizationNotFound.message) {
          if (showSnackBar) {
            navigatorService.showSnackBar("Organization Not Found");
          }
          return false;
        } else if (exception.graphqlErrors[i].message ==
            emailAccountPresent.message) {
          if (showSnackBar) {
            navigatorService
                .showSnackBar("Account with this email already registered");
          }
          return false;
        }
      }
      navigatorService.showSnackBar("Something went wrong");
      return false;
    }
  }

  Future<bool> refreshAccessToken(String refreshToken) async {
    final QueryResult result = await clientNonAuth.mutate(MutationOptions(
      document: gql(
        _query.refreshToken(refreshToken),
      ),
    ));

    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        refreshAccessToken(refreshToken);
      } else {
        navigatorService.pop();
      }
    } else if (result.data != null && result.isConcrete) {
      userConfig.updateAccessToken(
          refreshToken: result.data!['refreshToken']['refreshToken'].toString(),
          accessToken: result.data!['refreshToken']['accessToken'].toString());
      return true;
    }
    return false;
  }

  Future<bool> login(String email, String password) async {
    navigatorService
        .pushDialog(const ProgressDialog(key: Key('LoginProgress')));

    final QueryResult result = await clientNonAuth.mutate(
        MutationOptions(document: gql(_query.loginUser(email, password))));
    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        login(email, password);
      } else {
        navigatorService.pop();
      }
    } else if (result.data != null && result.isConcrete) {
      navigatorService.pop();
      final User loggedInUser =
          User.fromJson(result.data!['login'] as Map<String, dynamic>);
      userConfig.updateUser(loggedInUser);
      if (userConfig.currentUser!.joinedOrganizations!.isEmpty) {
        navigatorService.removeAllAndPush('/waiting', '/');
      } else {
        navigatorService.removeAllAndPush('/mainScreen', '/');
      }
      return true;
    }
    return false;
  }

  Future<bool> signup(
      String firstName, String lastName, String email, String password) async {
    navigatorService
        .pushDialog(const ProgressDialog(key: Key('SignUpProgress')));

    final QueryResult result = await clientNonAuth.mutate(MutationOptions(
        document:
            gql(_query.registerUser(firstName, lastName, email, password))));
    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        login(email, password);
      } else {
        navigatorService.pop();
      }
    } else if (result.data != null && result.isConcrete) {
      final User signedInUser =
          User.fromJson(result.data!['signUp'] as Map<String, dynamic>);
      final bool userSaved = await userConfig.updateUser(signedInUser);
      return userSaved;
    }
    return false;
  }

  Future<bool> joinPublicOrg(String id) async {
    final QueryResult result = await clientAuth
        .mutate(MutationOptions(document: gql(_query.joinOrgById(id))));

    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        refreshAccessToken(userConfig.currentUser!.refreshToken!);
        joinPublicOrg(id);
      } else {
        navigatorService.pop();
      }
    } else if (result.data != null && result.isConcrete) {
      final OrgInfo joinedOrg = OrgInfo.fromJson(
          result.data!['joinPublicOrganization']['joinedOrganizations'][0]
              as Map<String, dynamic>);
      userConfig.updateUserJoinedOrg([joinedOrg]);
      navigatorService.pop();
      return true;
    }
    return false;
  }

  Future<bool> sendMembershipRequest(String id) async {
    final QueryResult result = await clientAuth.mutate(
        MutationOptions(document: gql(_query.sendMembershipRequest(id))));
    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        refreshAccessToken(userConfig.currentUser!.refreshToken!);
        sendMembershipRequest(id);
      } else {
        navigatorService.pop();
      }
    } else if (result.data != null && result.isConcrete) {
      final OrgInfo membershipRequest = OrgInfo.fromJson(
          result.data!['sendMembershipRequest']['organization']
              as Map<String, dynamic>);
      userConfig.updateUserMemberRequestOrg([membershipRequest]);
      navigatorService.pop();
      return true;
    }
    return false;
  }

  Future<bool> fetchCurrentUserInfo(String id) async {
    final QueryResult result = await clientNonAuth.mutate(MutationOptions(
        document: gql(_query.fetchUserInfo), variables: {'id': id}));

    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        fetchCurrentUserInfo(id);
      } else {
        navigatorService.pop();
      }
    } else if (result.data != null && result.isConcrete) {
      final User userInfo = User.fromJson(
          result.data!['users'][0] as Map<String, dynamic>,
          fromOrg: true);
      userConfig.updateUser(userInfo);
      return true;
    }
    return false;
  }

  Future<dynamic> fetchOrgById(String id) async {
    final QueryResult result = await clientNonAuth
        .mutate(MutationOptions(document: gql(_query.fetchOrgById(id))));

    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        fetchOrgById(id);
      }
    } else if (result.data != null && result.isConcrete) {
      return OrgInfo.fromJson(
          result.data!['organizations'][0] as Map<String, dynamic>);
    }
    return false;
  }
}
