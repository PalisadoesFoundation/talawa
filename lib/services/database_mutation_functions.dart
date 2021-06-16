import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

class DataBaseMutationFunctions {
  late GraphQLClient clientNonAuth;
  late GraphQLClient clientAuth;
  late Queries _query;

  init() {
    clientNonAuth = graphqlConfig.clientToQuery();
    clientAuth = graphqlConfig.authClient();
    _query = Queries();
  }

  GraphQLError userNotFound = const GraphQLError(message: 'User not found');
  GraphQLError userNotAuthenticated =
      const GraphQLError(message: 'User is not authenticated');
  GraphQLError emailAccountPresent =
      const GraphQLError(message: 'Email address already exists');
  GraphQLError wrongCredentials =
      const GraphQLError(message: 'Invalid credentials');
  GraphQLError organizationNotFound =
      const GraphQLError(message: 'Organization not found');
  GraphQLError refreshAccessTokenExpiredException = const GraphQLError(
      message:
          'Access Token has expired. Please refresh session.: Undefined location');
  GraphQLError memberRequestExist =
      const GraphQLError(message: 'Membership Request already exists');

  bool? encounteredExceptionOrError(OperationException exception,
      {bool showSnackBar = true}) {
    if (exception.linkException != null) {
      debugPrint(exception.linkException.toString());
      if (showSnackBar) {
        navigationService.showSnackBar("Server not running/wrong url");
      }
      return false;
    } else {
      debugPrint(exception.graphqlErrors.toString());
      for (int i = 0; i < exception.graphqlErrors.length; i++) {
        if (exception.graphqlErrors[i].message ==
            refreshAccessTokenExpiredException.message) {
          return true;
        } else if (exception.graphqlErrors[i].message ==
            userNotAuthenticated.message) {
          return true;
        } else if (exception.graphqlErrors[i].message == userNotFound.message) {
          if (showSnackBar) {
            navigationService
                .showSnackBar("No account registered with this email");
          }
          return false;
        } else if (exception.graphqlErrors[i].message ==
            memberRequestExist.message) {
          if (showSnackBar) {
            navigationService.showSnackBar("Membership request already exist");
          }
          return false;
        } else if (exception.graphqlErrors[i].message ==
            wrongCredentials.message) {
          if (showSnackBar) {
            navigationService.showSnackBar("Enter a valid password");
          }
          return false;
        } else if (exception.graphqlErrors[i].message ==
            organizationNotFound.message) {
          if (showSnackBar) {
            navigationService.showSnackBar("Organization Not Found");
          }
          return false;
        } else if (exception.graphqlErrors[i].message ==
            emailAccountPresent.message) {
          if (showSnackBar) {
            navigationService
                .showSnackBar("Account with this email already registered");
          }
          return false;
        }
      }
      navigationService.showSnackBar("Something went wrong");
      return false;
    }
  }

  Future<Map<String, dynamic>> gqlquery(String query) async {
    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: <String, dynamic>{},
    );

    final QueryResult result = await clientAuth.query(options);
    if (result.hasException) {
      final bool? exception =
          encounteredExceptionOrError(result.exception!, showSnackBar: false);
      if (exception!) debugPrint("Exception Occured");
    } else if (result.data != null && result.isConcrete) {
      return result.data!;
    }

    return result.data!;
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
        navigationService.pop();
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
    navigationService
        .pushDialog(const CustomProgressDialog(key: Key('LoginProgress')));

    final QueryResult result = await clientNonAuth.mutate(
        MutationOptions(document: gql(_query.loginUser(email, password))));
    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        login(email, password);
      } else {
        navigationService.pop();
      }
    } else if (result.data != null && result.isConcrete) {
      navigationService.pop();
      final User loggedInUser =
          User.fromJson(result.data!['login'] as Map<String, dynamic>);
      userConfig.updateUser(loggedInUser);
      if (userConfig.currentUser.joinedOrganizations!.isEmpty) {
        navigationService.removeAllAndPush('/waiting', '/');
      } else {
        userConfig.saveCurrentOrgInHive(
            userConfig.currentUser.joinedOrganizations![0]);
        navigationService.removeAllAndPush('/mainScreen', '/');
      }
      return true;
    }
    return false;
  }

  Future<bool> signup(
      String firstName, String lastName, String email, String password) async {
    navigationService
        .pushDialog(const CustomProgressDialog(key: Key('SignUpProgress')));

    final QueryResult result = await clientNonAuth.mutate(MutationOptions(
        document:
            gql(_query.registerUser(firstName, lastName, email, password))));
    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        login(email, password);
      } else {
        navigationService.pop();
      }
    } else if (result.data != null && result.isConcrete) {
      final User signedInUser =
          User.fromJson(result.data!['signUp'] as Map<String, dynamic>);
      final bool userSaved = await userConfig.updateUser(signedInUser);
      final bool tokenRefreshed = await graphqlConfig.getToken() as bool;
      return userSaved && tokenRefreshed;
    }
    return false;
  }

  Future<bool> joinPublicOrg(String id) async {
    final QueryResult result = await clientAuth
        .mutate(MutationOptions(document: gql(_query.joinOrgById(id))));

    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        refreshAccessToken(userConfig.currentUser.refreshToken!)
            .then((value) => joinPublicOrg(id));
      } else {
        //navigatorService.pop();
      }
    } else if (result.data != null && result.isConcrete) {
      final List<OrgInfo>? joinedOrg = (result.data!['joinPublicOrganization']
              ['joinedOrganizations'] as List<dynamic>?)
          ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
          .toList();
      userConfig.updateUserJoinedOrg(joinedOrg!);
      //navigatorService.pop();
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
        refreshAccessToken(userConfig.currentUser.refreshToken!)
            .then((value) => sendMembershipRequest(id));
      } else {
        navigationService.pop();
      }
    } else if (result.data != null && result.isConcrete) {
      print(result.data!['sendMembershipRequest']['organization']);
      final OrgInfo membershipRequest = OrgInfo.fromJson(
          result.data!['sendMembershipRequest']['organization']
              as Map<String, dynamic>);
      userConfig.updateUserMemberRequestOrg([membershipRequest]);
      navigationService.pop();
      return true;
    }
    return false;
  }

  Future<bool> fetchCurrentUserInfo(String id) async {
    final QueryResult result = await clientNonAuth.mutate(MutationOptions(
        document: gql(_query.fetchUserInfo), variables: {'id': id}));

    if (result.hasException) {
      final bool? exception =
          encounteredExceptionOrError(result.exception!, showSnackBar: false);
      if (exception!) {
        fetchCurrentUserInfo(id);
      } else {
        //navigatorService.pop();
      }
    } else if (result.data != null && result.isConcrete) {
      final User userInfo = User.fromJson(
          result.data!['users'][0] as Map<String, dynamic>,
          fromOrg: true);
      userInfo.authToken = userConfig.currentUser.authToken;
      userInfo.refreshToken = userConfig.currentUser.refreshToken;
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
